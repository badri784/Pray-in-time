import 'package:flutter/material.dart';
import '../../../../core/utils/responsive_helper.dart';
import 'package:intl/intl.dart';

class PrayerAtTime extends StatelessWidget {
  const PrayerAtTime({
    super.key,
    required this.nextPrayerTimes,
    required this.nextPrayer,
  });

  final DateTime? nextPrayerTimes;
  final String nextPrayer;
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
          size: 20.clampSp(),
        ),
        const SizedBox(width: 8),
        nextPrayerTimes != null
            ? RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Prayer at ',
                      style: TextStyle(fontSize: 14.clampSp()),
                    ),
                    TextSpan(
                      text: formateTime(nextPrayerTimes!),
                      style: TextStyle(
                        fontSize: 14.clampSp(),
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
