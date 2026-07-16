import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

/// Utility class for responsive design across phones and tablets.
///
/// Usage:
/// - Call `ResponsiveHelper.isTablet(context)` to check device type
/// - Call `ResponsiveHelper.designSize(context)` to get the correct design size
/// - Use `12.clampSp()` instead of `12.sp` for fonts & icons
class ResponsiveHelper {
  ResponsiveHelper._();

  /// Devices with shortest side > 600dp are considered tablets.
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide > 600;
  }

  /// Returns the design size based on device type.
  /// - Phone: 390 x 884 (your original design)
  /// - Tablet: 600 x 1024 (so scale factor stays ~1.3x instead of ~2x)
  static Size designSize(BuildContext context) {
    if (isTablet(context)) {
      return const Size(600, 1024);
    }
    return const Size(390, 884);
  }
}

/// Extension to clamp `.sp` scaling so fonts/icons don't balloon on tablets.
///
/// Instead of `fontSize: 14.sp`, use `fontSize: 14.clampSp()`.
/// This limits the scaled value to at most 1.3× the original design value,
/// preventing text and icons from becoming oversized on tablets.
extension ClampedSp on num {
  /// Returns the ScreenUtil `.sp` value clamped to a max of 1.3× the raw value.
  double clampSp() {
    final scaled = toDouble().sp;
    final maxAllowed = toDouble() * 1.3;
    return min(scaled, maxAllowed);
  }
}
