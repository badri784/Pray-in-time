import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import 'next_prayer.dart';
import 'prayer_at.dart';
import 'timer_for_next_prayer.dart';

class ContainerLoadedPrayer extends StatelessWidget {
  const ContainerLoadedPrayer({
    super.key,
    required this.nextPrayer,
    required this.nextPrayerTime,
  });

  final String nextPrayer;
  final DateTime? nextPrayerTime;

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
          NextPrayerWidget(nextPrayer: nextPrayer),
          const Spacer(),
          TimerForNextPrayer(nextPrayerTime: nextPrayerTime),
          const Spacer(),
          PrayerAtTime(nextPrayerTime: nextPrayerTime),
          const Spacer(),
          Text('Mandatory Alarm Active', style: TextStyle(fontSize: 12.sp)),
          const Spacer(),
        ],
      ),
    );
  }
}
