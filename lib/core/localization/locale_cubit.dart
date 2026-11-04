import 'dart:ui';

import 'package:adhan/adhan.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../alarm.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit(Locale initialLocale) : super(initialLocale) {
    Intl.defaultLocale = initialLocale.languageCode;
  }

  static const String prefKey = 'app_locale';

  static Future<Locale> loadInitialLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? savedCode = prefs.getString(prefKey);
    if (savedCode == 'ar' || savedCode == 'en') {
      return Locale(savedCode!);
    }
    final String deviceLang = PlatformDispatcher.instance.locale.languageCode;
    return Locale(deviceLang == 'ar' ? 'ar' : 'en');
  }

  bool get isArabic => state.languageCode == 'ar';

  Future<void> changeLocale(Locale newLocale) async {
    if (state.languageCode == newLocale.languageCode) return;

    Intl.defaultLocale = newLocale.languageCode;
    emit(newLocale);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(prefKey, newLocale.languageCode);

    // Reschedule local Adhan alarms so notification prayer names match the new language
    final double? savedLat = prefs.getDouble('saved_lat');
    final double? savedLng = prefs.getDouble('saved_lng');
    if (savedLat != null && savedLng != null) {
      try {
        await schedulePrayerAlarms(
          Coordinates(savedLat, savedLng),
          languageCode: newLocale.languageCode,
        );
      } catch (_) {}
    }
  }

  Future<void> toggleLocale() async {
    final Locale next = isArabic ? const Locale('en') : const Locale('ar');
    await changeLocale(next);
  }
}

