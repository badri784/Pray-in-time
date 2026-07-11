import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:intl/intl.dart';
import 'package:pray_in_time/feature/ui/homescren/home_widget/prayer_info.dart';

/// A single prayer row with icon, name, time, and alarm bell.
class PrayerRow extends StatelessWidget {
  final PrayerInfo prayer;
  final bool isNext;
  final bool isPassed;

  const PrayerRow({
    super.key,
    required this.prayer,
    required this.isNext,
    required this.isPassed,
  });

  /// Resolves color based on prayer state: next → [active],
  /// passed → [passed], otherwise → [normal].
  Color _resolveColor({
    required Color active,
    required Color passed,
    required Color normal,
  }) {
    if (isNext) return active;
    if (isPassed) return passed;
    return normal;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final formattedTime = DateFormat('hh:mm a').format(prayer.time);
    final fadedOnSurface = colorScheme.onSurface.withValues(alpha: 0.35);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: isNext
            ? colorScheme.tertiary.withValues(alpha: 0.3)
            : Colors.transparent,
        borderRadius: isNext ? BorderRadius.circular(14.r) : null,
      ),
      child: Row(
        children: [
          _buildIcon(colorScheme, fadedOnSurface),
          SizedBox(width: 14.w),
          _buildName(colorScheme, fadedOnSurface),
          _buildTime(formattedTime, colorScheme, fadedOnSurface),
          SizedBox(width: 10.w),
          _buildBell(colorScheme, fadedOnSurface),
        ],
      ),
    );
  }

  Widget _buildIcon(ColorScheme colorScheme, Color fadedOnSurface) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        color: isNext
            ? colorScheme.secondary.withValues(alpha: 0.2)
            : colorScheme.surface,
        shape: BoxShape.circle,
        border: isNext
            ? Border.all(
                color: colorScheme.secondary.withValues(alpha: 0.4),
                width: 1.5,
              )
            : null,
      ),
      child: Icon(
        prayer.icon,
        color: _resolveColor(
          active: colorScheme.secondary,
          passed: fadedOnSurface,
          normal: colorScheme.secondary,
        ),
        size: 18.sp,
      ),
    );
  }

  Widget _buildName(ColorScheme colorScheme, Color fadedOnSurface) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            prayer.name,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: isNext ? FontWeight.w700 : FontWeight.w600,
              color: _resolveColor(
                active: colorScheme.secondary,
                passed: colorScheme.onSurface.withValues(alpha: 0.4),
                normal: colorScheme.onSurface,
              ),
            ),
          ),
          if (isNext) ...[
            SizedBox(height: 2.h),
            Text(
              'COMING UP NEXT',
              style: TextStyle(
                fontSize: 9.sp,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.2,
                color: colorScheme.primary,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTime(
    String formattedTime,
    ColorScheme colorScheme,
    Color fadedOnSurface,
  ) {
    return Text(
      formattedTime,
      style: TextStyle(
        fontSize: 13.sp,
        fontWeight: isNext ? FontWeight.w700 : FontWeight.w500,
        color: _resolveColor(
          active: colorScheme.secondary,
          passed: fadedOnSurface,
          normal: colorScheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
    );
  }

  Widget _buildBell(ColorScheme colorScheme, Color fadedOnSurface) {
    return Icon(
      isNext ? Icons.notifications_active : Icons.notifications_outlined,
      color: _resolveColor(
        active: colorScheme.secondary,
        passed: colorScheme.onSurface.withValues(alpha: 0.25),
        normal: colorScheme.secondary.withValues(alpha: 0.7),
      ),
      size: 20.sp,
    );
  }
}
