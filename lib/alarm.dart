import 'package:adhan/adhan.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'notification_helper.dart';

const int kDaysToSchedule = 7;
const int kDailyRefreshAlarmId = 999;

const Map<int, String> prayerNames = {
  0: 'الفجر',
  2: 'الظهر',
  3: 'العصر',
  4: 'المغرب',
  5: 'العشاء',
};

CalculationParameters buildPrayerParams() {
  final CalculationParameters params = CalculationMethod.egyptian
      .getParameters();
  params.madhab = Madhab.shafi;
  return params;
}

Future<void> schedulePrayerAlarms(
  Coordinates coordinates, {
  bool registerDailyWorker = true,
}) async {
  await NotificationHelper.init();
  final DateTime now = DateTime.now();
  final CalculationParameters params = buildPrayerParams();

  for (int day = 0; day < kDaysToSchedule; day++) {
    final DateTime targetDate = now.add(Duration(days: day));
    final DateComponents dateComponents = DateComponents.from(targetDate);
    final PrayerTimes dailyPrayers = PrayerTimes(
      coordinates,
      dateComponents,
      params,
    );

    final Map<int, DateTime> prayers = <int, DateTime>{
      0: dailyPrayers.fajr,
      2: dailyPrayers.dhuhr,
      3: dailyPrayers.asr,
      4: dailyPrayers.maghrib,
      5: dailyPrayers.isha,
    };

    for (final entry in prayers.entries) {
      final int prayerKey = entry.key;
      final DateTime time = entry.value;
      final int notificationId = day * 10 + prayerKey;

      if (time.isAfter(now)) {
        await NotificationHelper.scheduleAdhanNotification(
          id: notificationId,
          prayerName: prayerNames[prayerKey]!,
          scheduledTime: time,
        );
        debugPrint(
          '⏰ [اليوم +$day] تم جدولة أذان ${prayerNames[prayerKey]} (ID: $notificationId) في ${time.hour}:${time.minute.toString().padLeft(2, '0')}',
        );
      } else {
        await NotificationHelper.cancelNotification(notificationId);
      }
    }
  }

  if (registerDailyWorker) {
    await scheduleDailyRefreshWorker();
  }
}

Future<void> scheduleDailyRefreshWorker() async {
  final DateTime now = DateTime.now();
  final DateTime nextMidnight = DateTime(
    now.year,
    now.month,
    now.day + 1,
    0,
    5,
  );

  await AndroidAlarmManager.periodic(
    const Duration(hours: 24),
    kDailyRefreshAlarmId,
    dailyRescheduleCallback,
    startAt: nextMidnight,
    exact: true,
    wakeup: true,
    allowWhileIdle: true,
    rescheduleOnReboot: true,
  );
  debugPrint('🔄 تم تفعيل المجدد اليومي التلقائي للأذان الساعة 12:05 ص');
}

@pragma('vm:entry-point')
Future<void> dailyRescheduleCallback(int id) async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint('🔄 بدء التحديث اليومي الصامت لجدول الأذان في الخلفية...');

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final double lat = prefs.getDouble('saved_lat') ?? 30.0444;
  final double lng = prefs.getDouble('saved_lng') ?? 31.2357;

  await schedulePrayerAlarms(
    Coordinates(lat, lng),
    registerDailyWorker: false,
  );
  debugPrint('✅ تم تجديد جدول الأذان لمدة $kDaysToSchedule أيام قادمة بنجاح!');
}
