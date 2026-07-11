import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class DailyPrayerSchedule extends StatelessWidget {
  const DailyPrayerSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.hotel_class_sharp,
          color: Theme.of(context).colorScheme.secondary,
        ),
        SizedBox(width: 8.w),
        Text(
          'DAILY PRAYER SCHEDULE',
          style: TextStyle(color: Colors.white.withValues(alpha: 0.4)),
        ),
      ],
    );
  }
}
