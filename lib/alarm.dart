import 'package:adhan/adhan.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'notification_helper.dart';

const Map<int, String> prayerNames = {
  0: 'الفجر',
  2: 'الظهر',
  3: 'العصر',
  4: 'المغرب',
  5: 'العشاء',
};

Future<void> schedulePrayerAlarms(PrayerTimes prayerTimes) async {
  final now = DateTime.now();

  final prayers = <int, DateTime>{
    0: prayerTimes.fajr,
    2: prayerTimes.dhuhr,
    3: prayerTimes.asr,
    4: prayerTimes.maghrib,
    5: prayerTimes.isha,
  };

  final prefs = await SharedPreferences.getInstance();

  for (final entry in prayers.entries) {
    final id = entry.key;
    final time = entry.value;

    if (time.isAfter(now)) {
      await prefs.setString('prayer_name_$id', prayerNames[id]!);

      await AndroidAlarmManager.cancel(id);
      await AndroidAlarmManager.oneShotAt(
        time,
        id,
        myAlarmFunction,
        exact: true,
        wakeup: true,
      );
      debugPrint(
        '⏰ تم جدولة منبه ${prayerNames[id]} في ${time.hour}:${time.minute.toString().padLeft(2, '0')}',
      );
    } else {
      debugPrint('⏭️ ${prayerNames[id]} فات وقتها - تخطي');
    }
  }
}

@pragma('vm:entry-point')
void myAlarmFunction(int id) async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint("🔔 المنبه اشتغل في الخلفية بنجاح! ID: $id");
  final prefs = await SharedPreferences.getInstance();
  final prayerName = prefs.getString('prayer_name_$id') ?? 'الصلاة';
  await NotificationHelper.init();
  await NotificationHelper.showAlarmNotification(prayerName: prayerName);

  FlutterRingtonePlayer().play(
    fromAsset: "assets/sound/alarm.mp3",
    looping: true,
    volume: 0.1,
    asAlarm: true,
  );
}
