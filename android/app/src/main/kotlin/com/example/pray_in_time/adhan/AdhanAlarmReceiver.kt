package com.example.pray_in_time.adhan

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.PowerManager
import android.util.Log

class AdhanAlarmReceiver : BroadcastReceiver() {
    companion object {
        private const val TAG = "AdhanAlarmReceiver"
    }

    override fun onReceive(context: Context, intent: Intent) {
        val id = intent.getIntExtra(AdhanScheduler.EXTRA_ALARM_ID, 0)
        val prayerName = intent.getStringExtra(AdhanScheduler.EXTRA_PRAYER_NAME) ?: "الصلاة"
        Log.d(TAG, "Adhan alarm triggered! ID=$id, prayer=$prayerName")

        AdhanScheduler.removeSavedEntryOnly(context, id)

        val powerManager = context.getSystemService(Context.POWER_SERVICE) as PowerManager
        val wakeLock = powerManager.newWakeLock(
            PowerManager.PARTIAL_WAKE_LOCK,
            "PrayInTime::AdhanReceiverWakeLock"
        )
        wakeLock.acquire(10_000L)

        val serviceIntent = Intent(context, AdhanPlaybackService::class.java).apply {
            action = AdhanPlaybackService.ACTION_START_ADHAN
            putExtra(AdhanScheduler.EXTRA_PRAYER_NAME, prayerName)
        }

        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                context.startForegroundService(serviceIntent)
            } else {
                context.startService(serviceIntent)
            }
        } catch (e: Exception) {
            Log.e(TAG, "Failed to start AdhanPlaybackService: ${e.message}", e)
        }
    }
}

