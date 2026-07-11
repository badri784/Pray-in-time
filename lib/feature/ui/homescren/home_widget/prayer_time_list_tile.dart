import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:pray_in_time/feature/ui/homescren/home_widget/prayer_info.dart';
import 'package:pray_in_time/feature/ui/homescren/home_widget/prayer_row.dart';

/// Displays the full list of daily prayer times.
class PrayerTimeListTile extends StatelessWidget {
  final PrayerTimes prayerTimes;

  const PrayerTimeListTile({super.key, required this.prayerTimes});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final nextPrayer = prayerTimes.nextPrayer();
    final prayers = PrayerInfo.fromPrayerTimes(prayerTimes);

    return Column(
      children: List.generate(prayers.length, (index) {
        final prayer = prayers[index];
        final isNext = prayer.prayer == nextPrayer;
        final isPassed = prayer.time.isBefore(now) && !isNext;

        return Column(
          children: [
            PrayerRow(prayer: prayer, isNext: isNext, isPassed: isPassed),
            if (index < prayers.length - 1)
              Divider(
                height: 1,
                thickness: 0.5,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.08),
              ),
          ],
        );
      }),
    );
  }
}
