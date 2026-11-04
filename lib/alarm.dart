import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/services/native_adhan_service.dart';
import 'notification_helper.dart';

const int kDaysToSchedule = 14;

const Map<int, String> prayerNamesAr = {
  0: 'الفجر',
  2: 'الظهر',
  3: 'العصر',
  4: 'المغرب',
  5: 'العشاء',
};

const Map<int, String> prayerNamesEn = {
  0: 'Fajr',
  2: 'Dhuhr',
  3: 'Asr',
  4: 'Maghrib',
  5: 'Isha',
};

CalculationParameters buildPrayerParams() {
  final CalculationParameters params = CalculationMethod.egyptian
      .getParameters();
  params.madhab = Madhab.shafi;
  return params;
}

Future<void> schedulePrayerAlarms(
  Coordinates coordinates, {
  String? languageCode,
}) async {
  await NotificationHelper.init();
  // Clear any legacy scheduled local notifications so they don't overlap
  await NotificationHelper.flutterLocalNotificationsPlugin.cancelAll();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String resolvedLang =
      languageCode ?? prefs.getString('app_locale') ?? 'en';
  final Map<int, String> names = resolvedLang == 'ar'
      ? prayerNamesAr
      : prayerNamesEn;

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
      final int alarmId = day * 10 + prayerKey;

      if (time.isAfter(now)) {
        await NativeAdhanService.scheduleAdhan(
          id: alarmId,
          prayerName: names[prayerKey]!,
          scheduledTime: time,
        );
        debugPrint(
          '⏰ [Day +$day] Scheduled Adhan ${names[prayerKey]} (ID: $alarmId) at ${time.hour}:${time.minute.toString().padLeft(2, '0')}',
        );
      } else {
        await NativeAdhanService.cancelAdhan(alarmId);
      }
    }
  }
}
