import 'dart:math' as math;
import 'dart:developer';

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../../../../core/logic/prayer_time_cubit.dart';
import '../../../../core/logic/prayer_time_state.dart';
import 'conteiner_loaded_prayer.dart';
import '../../../widget/prayer_time_error_widget.dart';
import '../../../widget/prayer_time_loading_widget.dart';

class ConrtainerOfNextPrayreBuilder extends StatelessWidget {
  const ConrtainerOfNextPrayreBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    // final prayerTimes = context.read<PrayerTimeCubit>().getPrayerTimes();
    // final PrayerTimes prayerTimes = PrayerTimes();
    return BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
      builder: (context, state) {
        if (state is PrayerTimeLoading) {
          return const PrayerTimeLoadingWidget(text: 'loading prayer ...');
        }
        if (state is PrayerTimeError) {
          return PrayerTimeErrorWidget(message: state.message);
        }
        if (state is PrayerTimeLoaded) {
          final PrayerTimes prayerTimes = state.prayerTimes;
          final String nextPrayer = prayerTimes.nextPrayer().name;
          final DateTime? nextPrayerTime = prayerTimes.timeForPrayer(
            prayerTimes.nextPrayer(),
          );
          log('nextPrayerTime: $nextPrayerTime');
          return ContainerLoadedPrayer(
            nextPrayer: nextPrayer,
            nextPrayerTime: nextPrayerTime,
          );
        } else {
          return Container(
            height: math.min(250.h, 300),
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
            child: const Center(child: Text('No prayer times found')),
          );
        }
      },
    );
  }
}
