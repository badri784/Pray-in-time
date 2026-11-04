package com.example.pray_in_time.adhan

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.content.pm.ServiceInfo
import android.graphics.drawable.Icon
import android.media.AudioAttributes
import android.media.AudioFocusRequest
import android.media.AudioManager
import android.media.MediaPlayer
import android.os.Build
import android.os.IBinder
import android.os.PowerManager
import android.util.Log
import com.example.pray_in_time.MainActivity
import com.example.pray_in_time.R

class AdhanPlaybackService : Service() {
    companion object {
        private const val TAG = "AdhanPlaybackService"
        const val ACTION_START_ADHAN = "com.example.pray_in_time.ACTION_START_ADHAN"
        const val ACTION_STOP_ADHAN = "com.example.pray_in_time.ACTION_STOP_ADHAN"

        private const val PLAYBACK_CHANNEL_ID = "adhan_playback_foreground_channel"
        private const val COMPLETED_CHANNEL_ID = "adhan_completed_reminder_channel"
        private const val FOREGROUND_NOTIFICATION_ID = 7001
        private const val COMPLETED_NOTIFICATION_ID = 7002
    }

    private var mediaPlayer: MediaPlayer? = null
    private var wakeLock: PowerManager.WakeLock? = null
    private var audioFocusRequest: AudioFocusRequest? = null

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        if (intent?.action == ACTION_STOP_ADHAN) {
            Log.d(TAG, "User stopped Adhan playback.")
            stopAdhanAndSelf()
            return START_NOT_STICKY
        }

        val prayerName = intent?.getStringExtra(AdhanScheduler.EXTRA_PRAYER_NAME) ?: "الصلاة"
        ensureNotificationChannels()

        val notification = buildForegroundNotification(prayerName)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            startForeground(
                FOREGROUND_NOTIFICATION_ID,
                notification,
                ServiceInfo.FOREGROUND_SERVICE_TYPE_MEDIA_PLAYBACK
            )
        } else {
            startForeground(FOREGROUND_NOTIFICATION_ID, notification)
        }

        startAdhanAudio(prayerName)
        return START_NOT_STICKY
    }

    private fun startAdhanAudio(prayerName: String) {
        releaseAudioAndWakeLock()

        val powerManager = getSystemService(Context.POWER_SERVICE) as PowerManager
        wakeLock = powerManager.newWakeLock(
            PowerManager.PARTIAL_WAKE_LOCK,
            "PrayInTime::AdhanPlaybackWakeLock"
        ).apply {
            acquire(6 * 60 * 1000L) // Max 6 minutes safety timeout
        }

        requestAlarmAudioFocus()

        try {
            val afd = resources.openRawResourceFd(R.raw.alarm)
            mediaPlayer = MediaPlayer().apply {
                setAudioAttributes(
                    AudioAttributes.Builder()
                        .setUsage(AudioAttributes.USAGE_ALARM)
                        .setContentType(AudioAttributes.CONTENT_TYPE_MUSIC)
                        .build()
                )
                setDataSource(afd.fileDescriptor, afd.startOffset, afd.length)
                afd.close()
                isLooping = false
                setVolume(1.0f, 1.0f)
                setOnCompletionListener {
                    Log.d(TAG, "Adhan completed naturally for $prayerName")
                    showCompletedNotification(prayerName)
                    stopAdhanAndSelf()
                }
                setOnErrorListener { _, what, extra ->
                    Log.e(TAG, "MediaPlayer error (what=$what, extra=$extra)")
                    stopAdhanAndSelf()
                    true
                }
                prepare()
                start()
            }
            Log.d(TAG, "Playing full Adhan for $prayerName")
        } catch (e: Exception) {
            Log.e(TAG, "Error starting Adhan MediaPlayer: ${e.message}", e)
            stopAdhanAndSelf()
        }
    }

    private fun requestAlarmAudioFocus() {
        val audioManager = getSystemService(Context.AUDIO_SERVICE) as AudioManager
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val focusReq = AudioFocusRequest.Builder(AudioManager.AUDIOFOCUS_GAIN_TRANSIENT)
                .setAudioAttributes(
                    AudioAttributes.Builder()
                        .setUsage(AudioAttributes.USAGE_ALARM)
                        .setContentType(AudioAttributes.CONTENT_TYPE_MUSIC)
                        .build()
                )
                .build()
            audioFocusRequest = focusReq
            audioManager.requestAudioFocus(focusReq)
        } else {
            @Suppress("DEPRECATION")
            audioManager.requestAudioFocus(
                null,
                AudioManager.STREAM_ALARM,
                AudioManager.AUDIOFOCUS_GAIN_TRANSIENT
            )
        }
    }

    private fun abandonAlarmAudioFocus() {
        val audioManager = getSystemService(Context.AUDIO_SERVICE) as AudioManager
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            audioFocusRequest?.let { audioManager.abandonAudioFocusRequest(it) }
            audioFocusRequest = null
        } else {
            @Suppress("DEPRECATION")
            audioManager.abandonAudioFocus(null)
        }
    }

    private fun ensureNotificationChannels() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val manager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

            val playbackChannel = NotificationChannel(
                PLAYBACK_CHANNEL_ID,
                "تشغيل الأذان",
                NotificationManager.IMPORTANCE_HIGH
            ).apply {
                description = "إشعار تشغيل صوت الأذان في أوقات الصلاة"
                setSound(null, null) // Sound is handled by MediaPlayer on USAGE_ALARM
                enableVibration(true)
                lockscreenVisibility = Notification.VISIBILITY_PUBLIC
            }
            manager.createNotificationChannel(playbackChannel)

            val completedChannel = NotificationChannel(
                COMPLETED_CHANNEL_ID,
                "تذكير الصلاة",
                NotificationManager.IMPORTANCE_DEFAULT
            ).apply {
                description = "تذكير بدخول وقت الصلاة بعد انتهاء الأذان"
                setSound(null, null)
                enableVibration(false)
                lockscreenVisibility = Notification.VISIBILITY_PUBLIC
            }
            manager.createNotificationChannel(completedChannel)
        }
    }

    private fun buildForegroundNotification(prayerName: String): Notification {
        val openAppIntent = Intent(this, MainActivity::class.java).apply {
            flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
        }
        val openAppPendingIntent = PendingIntent.getActivity(
            this,
            0,
            openAppIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        val stopIntent = Intent(this, AdhanPlaybackService::class.java).apply {
            action = ACTION_STOP_ADHAN
        }
        val stopPendingIntent = PendingIntent.getService(
            this,
            1,
            stopIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        val builder = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            Notification.Builder(this, PLAYBACK_CHANNEL_ID)
        } else {
            @Suppress("DEPRECATION")
            Notification.Builder(this).setPriority(Notification.PRIORITY_MAX)
        }

        val stopAction = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            Notification.Action.Builder(
                Icon.createWithResource(this, android.R.drawable.ic_media_pause),
                "إيقاف الأذان",
                stopPendingIntent
            ).build()
        } else {
            @Suppress("DEPRECATION")
            Notification.Action(
                android.R.drawable.ic_media_pause,
                "إيقاف الأذان",
                stopPendingIntent
            )
        }

        return builder
            .setSmallIcon(R.drawable.ic_app_notification)
            .setColor(0xFFFFAB00.toInt())
            .setContentTitle("حان وقت صلاة $prayerName")
            .setContentText("حيّ على الصلاة 🕌")
            .setCategory(Notification.CATEGORY_ALARM)
            .setVisibility(Notification.VISIBILITY_PUBLIC)
            .setContentIntent(openAppPendingIntent)
            .setDeleteIntent(stopPendingIntent)
            .setOngoing(true)
            .addAction(stopAction)
            .build()
    }

    private fun showCompletedNotification(prayerName: String) {
        val openAppIntent = Intent(this, MainActivity::class.java).apply {
            flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
        }
        val openAppPendingIntent = PendingIntent.getActivity(
            this,
            2,
            openAppIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        val builder = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            Notification.Builder(this, COMPLETED_CHANNEL_ID)
        } else {
            @Suppress("DEPRECATION")
            Notification.Builder(this)
        }

        val notification = builder
            .setSmallIcon(R.drawable.ic_app_notification)
            .setColor(0xFFFFAB00.toInt())
            .setContentTitle("حان وقت صلاة $prayerName")
            .setContentText("حيّ على الصلاة 🕌")
            .setAutoCancel(true)
            .setVisibility(Notification.VISIBILITY_PUBLIC)
            .setContentIntent(openAppPendingIntent)
            .build()

        val manager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        manager.notify(COMPLETED_NOTIFICATION_ID, notification)
    }

    private fun stopAdhanAndSelf() {
        releaseAudioAndWakeLock()
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            stopForeground(STOP_FOREGROUND_REMOVE)
        } else {
            @Suppress("DEPRECATION")
            stopForeground(true)
        }
        stopSelf()
    }

    private fun releaseAudioAndWakeLock() {
        try {
            mediaPlayer?.let { player ->
                if (player.isPlaying) {
                    player.stop()
                }
                player.release()
            }
        } catch (e: Exception) {
            Log.w(TAG, "MediaPlayer release warning: ${e.message}")
        } finally {
            mediaPlayer = null
        }

        abandonAlarmAudioFocus()

        try {
            wakeLock?.let { wl ->
                if (wl.isHeld) {
                    wl.release()
                }
            }
        } catch (e: Exception) {
            Log.w(TAG, "WakeLock release warning: ${e.message}")
        } finally {
            wakeLock = null
        }
    }

    override fun onDestroy() {
        releaseAudioAndWakeLock()
        super.onDestroy()
    }
}

