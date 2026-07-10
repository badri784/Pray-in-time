import 'package:flutter/material.dart';

class AppColors {
  // =========================================
  // 1. Shared Colors (الألوان المشتركة في الـ 2 Themes)
  // =========================================
  static const Color primaryEmerald = Color(0xFF00875A); // الأخضر الزمردي
  static const Color primaryNavy = Color(
    0xFF2C3E50,
  ); // الأزرق الداكن (للاحتياط)
  static const Color accentGold = Color(
    0xFFF5A623,
  ); // الدهبي بتاع العداد والأيقونات

  // =========================================
  // 2. Dark Theme Colors (ألوان الوضع الليلي)
  // =========================================
  static const Color darkBackground = Color(0xff020618); // لون الشاشة الأساسي
  static const Color darkSurface = Color(0xFF1E1E1E); // لون الكروت (Cards)
  static const Color darkSurfaceHighlight = Color(
    0xFF2A3A34,
  ); // خلفية الكارت الكبير (تأثير الأخضر الغامق)
  static const Color darkTextPrimary = Color(
    0xFFFFFFFF,
  ); // التيكست الأساسي (أبيض)
  static const Color darkTextSecondary = Color(
    0xFFA0A0A0,
  ); // التيكست الفرعي (رمادي)
  static const Color darkDivider = Color(0xFF2C2C2C); // خطوط الفصل بين الصلوات

  // =========================================
  // 3. Light Theme Colors (ألوان الوضع الفاتح)
  // =========================================
  static const Color lightBackground = Color(0xFFFFFFFF); // لون الشاشة الأساسي
  static const Color lightSurface = Color(0xFFF5F5F5); // لون الكروت (Cards)
  static const Color lightSurfaceHighlight = Color(
    0xFFE5EFEA,
  ); // خلفية الكارت الكبير (تأثير الأخضر الفاتح)
  static const Color lightTextPrimary = Color(
    0xFF1A1A1A,
  ); // التيكست الأساسي (أسود)
  static const Color lightTextSecondary = Color(
    0xFF757575,
  ); // التيكست الفرعي (رمادي)
  static const Color lightDivider = Color(0xFFE0E0E0); // خطوط الفصل بين الصلوات
}
