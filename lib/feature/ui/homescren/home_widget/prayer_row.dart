import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:intl/intl.dart';

import '../../../../core/localization/l10n_extension.dart';
import '../../../../core/utils/responsive_helper.dart';
import 'prayer_info.dart';

class PrayerRow extends StatelessWidget {
  const PrayerRow({
    super.key,
    required this.prayer,
    required this.isNext,
    required this.isPassed,
  });

  final PrayerInfo prayer;
  final bool isNext;
  final bool isPassed;

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
    final formattedTime = DateFormat(
      'hh:mm a',
      context.localeCode,
    ).format(prayer.time);
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
          _buildName(context, colorScheme, fadedOnSurface),
          _buildTime(formattedTime, colorScheme, fadedOnSurface),
          SizedBox(width: 10.w),
          _buildBell(colorScheme, fadedOnSurface),
        ],
      ),
    );
  }

  Widget _buildIcon(ColorScheme colorScheme, Color fadedOnSurface) {
    return Container(
      padding: EdgeInsets.all(8.clampSp()),
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
        size: 18.clampSp(),
      ),
    );
  }

  Widget _buildName(
    BuildContext context,
    ColorScheme colorScheme,
    Color fadedOnSurface,
  ) {
    final displayName = context.localizedPrayerName(prayer.prayer.name);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            displayName,
            style: TextStyle(
              fontSize: 15.clampSp(),
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
              context.l10n.comingUpNext,
              style: TextStyle(
                fontSize: 9.clampSp(),
                fontWeight: FontWeight.w800,
                letterSpacing: context.isArabic ? 0 : 1.2,
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
        fontSize: 13.clampSp(),
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
      size: 20.clampSp(),
    );
  }
}
