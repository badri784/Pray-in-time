import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../l10n/app_localizations.dart';

export '../../l10n/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  Locale get currentLocale => Localizations.localeOf(this);

  String get localeCode => currentLocale.languageCode;

  bool get isArabic => localeCode == 'ar';

  TextStyle adaptiveFont({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    if (isArabic) {
      return GoogleFonts.cairo(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: height,
      );
    }
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  String localizedPrayerName(String? rawName) {
    if (rawName == null) return l10n.prayerFajr;
    switch (rawName.toLowerCase().trim()) {
      case 'fajr':
      case 'none':
        return l10n.prayerFajr;
      case 'sunrise':
        return l10n.prayerSunrise;
      case 'dhuhr':
        return l10n.prayerDhuhr;
      case 'asr':
        return l10n.prayerAsr;
      case 'maghrib':
        return l10n.prayerMaghrib;
      case 'isha':
        return l10n.prayerIsha;
      default:
        return rawName;
    }
  }
}
