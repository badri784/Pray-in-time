import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class PrayerAtTime extends StatelessWidget {
  const PrayerAtTime({super.key, required this.nextPrayerTime});

  final DateTime? nextPrayerTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.access_time,
          color: Theme.of(context).colorScheme.secondary,
          size: 20.sp,
        ),
        const SizedBox(width: 8),
        Text(
          'Prayer at ${nextPrayerTime?.hour}:${nextPrayerTime?.minute}',
          style: TextStyle(fontSize: 14.sp),
        ),
      ],
    );
  }
}
