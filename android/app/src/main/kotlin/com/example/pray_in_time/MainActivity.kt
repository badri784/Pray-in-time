package com.example.pray_in_time

import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.view.WindowManager
import com.example.pray_in_time.adhan.AdhanPlaybackService
import com.example.pray_in_time.adhan.AdhanScheduler
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    companion object {
        private const val ADHAN_CHANNEL = "com.example.pray_in_time/adhan_alarm"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // الأكواد دي هي المسؤولة عن إيقاظ الشاشة وعرضها فوق القفل
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O_MR1) {
            setShowWhenLocked(true)
            setTurnScreenOn(true)
        } else {
            @Suppress("DEPRECATION")
            window.addFlags(
                WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED or
                    WindowManager.LayoutParams.FLAG_TURN_SCREEN_ON
            )
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, ADHAN_CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "scheduleAdhan" -> {
                        val id = call.argument<Int>("id")
                        val prayerName = call.argument<String>("prayerName")
                        val epochMillis = call.argument<Number>("epochMillis")?.toLong()

                        if (id == null || prayerName == null || epochMillis == null) {
                            result.error("INVALID_ARGS", "Missing id, prayerName, or epochMillis", null)
                        } else {
                            AdhanScheduler.schedule(applicationContext, id, prayerName, epochMillis)
                            result.success(true)
                        }
                    }

                    "cancelAdhan" -> {
                        val id = call.argument<Int>("id")
                        if (id == null) {
                            result.error("INVALID_ARGS", "Missing id", null)
                        } else {
                            AdhanScheduler.cancel(applicationContext, id)
                            result.success(true)
                        }
                    }

                    "stopAdhan" -> {
                        val stopIntent = Intent(applicationContext, AdhanPlaybackService::class.java).apply {
                            action = AdhanPlaybackService.ACTION_STOP_ADHAN
                        }
                        applicationContext.startService(stopIntent)
                        result.success(true)
                    }

                    "playAdhanNow" -> {
                        val prayerName = call.argument<String>("prayerName") ?: "الصلاة"
                        val serviceIntent = Intent(applicationContext, AdhanPlaybackService::class.java).apply {
                            action = AdhanPlaybackService.ACTION_START_ADHAN
                            putExtra(AdhanScheduler.EXTRA_PRAYER_NAME, prayerName)
                        }
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                            applicationContext.startForegroundService(serviceIntent)
                        } else {
                            applicationContext.startService(serviceIntent)
                        }
                        result.success(true)
                    }

                    else -> result.notImplemented()
                }
            }
    }
}
