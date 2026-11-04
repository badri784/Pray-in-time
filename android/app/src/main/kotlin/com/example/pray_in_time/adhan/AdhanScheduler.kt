package com.example.pray_in_time.adhan

import android.app.AlarmManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.os.Build
import android.util.Log
import com.example.pray_in_time.MainActivity
import org.json.JSONObject

object AdhanScheduler {
    private const val TAG = "AdhanScheduler"
    private const val PREFS_NAME = "adhan_native_schedules"
    const val EXTRA_ALARM_ID = "extra_alarm_id"
    const val EXTRA_PRAYER_NAME = "extra_prayer_name"

    fun schedule(context: Context, id: Int, prayerName: String, epochMillis: Long) {
        if (epochMillis <= System.currentTimeMillis()) {
            cancel(context, id)
            return
        }

        val alarmManager = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
        val triggerPendingIntent = buildTriggerPendingIntent(context, id, prayerName)

        val showIntent = Intent(context, MainActivity::class.java).apply {
            flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
        }
        val showPendingIntent = PendingIntent.getActivity(
            context,
            id,
            showIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        try {
            val canExact = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                alarmManager.canScheduleExactAlarms()
            } else {
                true
            }

            if (canExact) {
                val alarmClockInfo = AlarmManager.AlarmClockInfo(epochMillis, showPendingIntent)
                alarmManager.setAlarmClock(alarmClockInfo, triggerPendingIntent)
            } else {
                alarmManager.setAndAllowWhileIdle(
                    AlarmManager.RTC_WAKEUP,
                    epochMillis,
                    triggerPendingIntent
                )
            }

            saveAlarmToPrefs(context, id, prayerName, epochMillis)
            Log.d(TAG, "Scheduled Adhan [$prayerName] (ID=$id) at $epochMillis")
        } catch (e: SecurityException) {
            Log.e(TAG, "SecurityException scheduling exact Adhan alarm: ${e.message}", e)
            alarmManager.setAndAllowWhileIdle(
                AlarmManager.RTC_WAKEUP,
                epochMillis,
                triggerPendingIntent
            )
            saveAlarmToPrefs(context, id, prayerName, epochMillis)
        }
    }

    fun cancel(context: Context, id: Int) {
        val alarmManager = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
        val pendingIntent = buildTriggerPendingIntent(context, id, "")
        alarmManager.cancel(pendingIntent)
        pendingIntent.cancel()
        removeAlarmFromPrefs(context, id)
    }

    fun removeSavedEntryOnly(context: Context, id: Int) {
        removeAlarmFromPrefs(context, id)
    }

    fun rescheduleSavedAlarms(context: Context) {
        val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val now = System.currentTimeMillis()
        val allEntries = prefs.all

        for ((key, value) in allEntries) {
            val id = key.toIntOrNull() ?: continue
            val jsonStr = value as? String ?: continue
            try {
                val obj = JSONObject(jsonStr)
                val epochMillis = obj.getLong("epochMillis")
                val prayerName = obj.getString("prayerName")
                if (epochMillis > now) {
                    schedule(context, id, prayerName, epochMillis)
                } else {
                    removeAlarmFromPrefs(context, id)
                }
            } catch (e: Exception) {
                Log.e(TAG, "Failed to parse saved alarm $key: ${e.message}")
                removeAlarmFromPrefs(context, id)
            }
        }
    }

    private fun buildTriggerPendingIntent(
        context: Context,
        id: Int,
        prayerName: String
    ): PendingIntent {
        val intent = Intent(context, AdhanAlarmReceiver::class.java).apply {
            action = "com.example.pray_in_time.ACTION_ADHAN_ALARM_$id"
            putExtra(EXTRA_ALARM_ID, id)
            putExtra(EXTRA_PRAYER_NAME, prayerName)
        }
        return PendingIntent.getBroadcast(
            context,
            id,
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
    }

    private fun saveAlarmToPrefs(
        context: Context,
        id: Int,
        prayerName: String,
        epochMillis: Long
    ) {
        val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val json = JSONObject().apply {
            put("prayerName", prayerName)
            put("epochMillis", epochMillis)
        }
        prefs.edit().putString(id.toString(), json.toString()).apply()
    }

    private fun removeAlarmFromPrefs(context: Context, id: Int) {
        val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        prefs.edit().remove(id.toString()).apply()
    }
}

