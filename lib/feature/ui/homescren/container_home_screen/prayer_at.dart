import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:intl/intl.dart';

class PrayerAtTime extends StatelessWidget {
  const PrayerAtTime({super.key, required this.nextPrayerTime});

  final DateTime? nextPrayerTime;
  String formateTime(DateTime time) {
    return DateFormat.jm().format(time);
  }

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
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Prayer at ',
                style: TextStyle(fontSize: 14.sp),
              ),
              TextSpan(
                text: formateTime(nextPrayerTime ?? DateTime(0)),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
