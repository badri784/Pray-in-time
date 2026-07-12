import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class ContainerLoadedPrayer extends StatelessWidget {
  const ContainerLoadedPrayer({super.key, required this.nextPrayer});

  final String nextPrayer;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: const LinearGradient(
          colors: [
            Color(0xff0d0f2f),
            Color(0xff0f1134),
            Color(0xff101239),
            Color(0xff12133e),
            Color(0xff101239),
            Color(0xff0f1134),
            Color(0xff0d0f2f),
          ],
          stops: [0.0, 0.15, 0.35, 0.5, 0.65, 0.85, 1.0],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(
                  context,
                ).colorScheme.secondary.withValues(alpha: 0.7),
                width: .9,
              ),
              borderRadius: BorderRadius.circular(16.r),
              color: Theme.of(
                context,
              ).colorScheme.secondary.withValues(alpha: 0.07),
            ),

            child: Text(
              'Next prayer: $nextPrayer',
              style: TextStyle(
                fontSize: 12.sp,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          const Spacer(),

          const Text('Timer', style: TextStyle(fontSize: 28)),
          const Spacer(),
          Text('Prayer at 04:37 PM', style: TextStyle(fontSize: 14.sp)),
          const Spacer(),
          Text('Mandatory Alarm Active', style: TextStyle(fontSize: 12.sp)),
          const Spacer(),
        ],
      ),
    );
  }
}
