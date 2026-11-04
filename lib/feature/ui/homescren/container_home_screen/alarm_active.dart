import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../../../../core/localization/l10n_extension.dart';
import '../../../../core/utils/responsive_helper.dart';

class AlarmActive extends StatelessWidget {
  const AlarmActive({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: min(200.w, 280)),
      height: 36.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.5),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications,
            size: 16.clampSp(),
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(width: 8),
          Text(
            context.l10n.mandatoryAlarmActive,
            style: TextStyle(
              fontSize: 12.clampSp(),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
