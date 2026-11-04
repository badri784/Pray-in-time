import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/localization/l10n_extension.dart';
import '../../../../core/utils/responsive_helper.dart';

class PrayerAtTime extends StatelessWidget {
  const PrayerAtTime({
    super.key,
    required this.nextPrayerTimes,
    required this.nextPrayer,
  });

  final DateTime? nextPrayerTimes;
  final String nextPrayer;

  String formateTime(DateTime time, String localeCode) {
    return DateFormat.jm(localeCode).format(time);
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
            ? Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: context.l10n.prayerAt,
                      style: TextStyle(fontSize: 14.clampSp()),
                    ),
                    TextSpan(
                      text: formateTime(nextPrayerTimes!, context.localeCode),
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
