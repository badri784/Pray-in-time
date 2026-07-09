import 'package:flutter/material.dart';
import 'package:pray_in_time/core/theming/app_color.dart';

class AppTheme {
  // =========================================
  // 1. Light Theme
  // =========================================
  static ThemeData get lightTheme {
    return ThemeData(
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

  static ThemeData get darkTheme {
    return ThemeData(
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
