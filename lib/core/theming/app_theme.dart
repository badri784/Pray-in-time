import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';

class AppTheme {
  // =========================================
  // 1. Light Theme
  // =========================================
  static ThemeData lightTheme([Locale? locale]) {
    final bool isArabic = locale?.languageCode == 'ar';
    final String? fontFamily = isArabic
        ? GoogleFonts.cairo().fontFamily
        : GoogleFonts.spaceGrotesk().fontFamily;

    return ThemeData(
      fontFamily: fontFamily,
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBackground,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryEmerald,
        brightness: Brightness.light,
        // الألوان الأساسية
        primary: AppColors.primaryEmerald,
        onPrimary: const Color(0xFFFFFFFF),

        // الألوان الفرعية (زي زرار التنبيه أو العداد الدهبي)
        secondary: AppColors.accentGold,
        onSecondary: const Color(0xFF000000),

        // ألوان الكروت والخلفيات
        surface: AppColors.lightSurface,
        onSurface: AppColors.lightTextPrimary,

        // ألوان إضافية للـ Highlights (اختياري)
        tertiary: AppColors.primaryNavy,
        onTertiary: const Color(0xFFFFFFFF),

        // ألوان الخطأ
        error: const Color(0xFFBA1A1A),
        onError: const Color(0xFFFFFFFF),
      ),
    );
  }

  static ThemeData darkTheme([Locale? locale]) {
    final bool isArabic = locale?.languageCode == 'ar';
    final String? fontFamily = isArabic
        ? GoogleFonts.cairo().fontFamily
        : GoogleFonts.spaceGrotesk().fontFamily;

    return ThemeData(
      fontFamily: fontFamily,
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryEmerald,
        brightness: Brightness.dark,
        // الألوان الأساسية (ممكن نخلي الأخضر أفتح سنة بسيطة في الـ Dark لو حبيت، أو نسيبه زي ما هو)
        primary: AppColors.primaryEmerald,
        onPrimary: const Color(0xFFFFFFFF),

        // الألوان الفرعية
        secondary: AppColors.accentGold,
        onSecondary: const Color(0xFF000000),

        // ألوان الكروت والخلفيات
        surface: AppColors.darkSurface,
        onSurface: AppColors.darkTextPrimary,

        // ألوان إضافية للـ Highlights
        tertiary: AppColors.darkSurfaceHighlight,
        onTertiary: const Color(0xFFFFFFFF),

        // ألوان الخطأ
        error: const Color(0xFFCF6679),
        onError: const Color(0xFF000000),
      ),
    );
  }
}
