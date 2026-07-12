import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';

/// Data model for a single prayer entry.
class PrayerInfo {
  const PrayerInfo({
    required this.name,
    required this.arabicName,
    required this.time,
    required this.icon,
    required this.prayer,
  });
  final String name;
  final String arabicName;
  final DateTime time;
  final IconData icon;
  final Prayer prayer;

  /// Builds the full list of prayers from [PrayerTimes].
  static List<PrayerInfo> fromPrayerTimes(PrayerTimes pt) => [
    PrayerInfo(
      name: 'Fajr',
      arabicName: 'الفجر',
      time: pt.fajr,
      icon: Icons.nightlight_round,
      prayer: Prayer.fajr,
    ),
    PrayerInfo(
      name: 'Sunrise',
      arabicName: 'الشروق',
      time: pt.sunrise,
      icon: Icons.wb_twilight,
      prayer: Prayer.sunrise,
    ),
    PrayerInfo(
      name: 'Dhuhr',
      arabicName: 'الظهر',
      time: pt.dhuhr,
      icon: Icons.wb_sunny_outlined,
      prayer: Prayer.dhuhr,
    ),
    PrayerInfo(
      name: 'Asr',
      arabicName: 'العصر',
      time: pt.asr,
      icon: Icons.cloud_outlined,
      prayer: Prayer.asr,
    ),
    PrayerInfo(
      name: 'Maghrib',
      arabicName: 'المغرب',
      time: pt.maghrib,
      icon: Icons.nights_stay,
      prayer: Prayer.maghrib,
    ),
    PrayerInfo(
      name: 'Isha',
      arabicName: 'العشاء',
      time: pt.isha,
      icon: Icons.nightlight_round,
      prayer: Prayer.isha,
    ),
  ];
}
