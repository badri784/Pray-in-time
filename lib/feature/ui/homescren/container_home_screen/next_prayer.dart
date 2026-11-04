import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../../../../core/localization/l10n_extension.dart';
import '../../../../core/utils/responsive_helper.dart';

class NextPrayerWidget extends StatelessWidget {
  const NextPrayerWidget({super.key, required this.nextPrayer});

  final String? nextPrayer;

  @override
  Widget build(BuildContext context) {
    final String prayerLabel = context.localizedPrayerName(nextPrayer);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.7),
          width: .6,
        ),
        borderRadius: BorderRadius.circular(12.r),
        color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.07),
      ),
      child: Text(
        context.l10n.nextPrayerLabel(prayerLabel),
        style: TextStyle(
          fontSize: 13.clampSp(),
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
