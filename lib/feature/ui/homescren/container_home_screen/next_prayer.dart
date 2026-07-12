import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class NextPrayerWidget extends StatelessWidget {
  const NextPrayerWidget({super.key, required this.nextPrayer});

  final String nextPrayer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.7),
          width: .9,
        ),
        borderRadius: BorderRadius.circular(16.r),
        color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.07),
      ),

      child: Text(
        'Next prayer: $nextPrayer',
        style: TextStyle(
          fontSize: 12.sp,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
