import 'dart:developer';
import 'dart:math' hide log;

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../../../../core/logic/prayer_time_cubit.dart';
import '../../../../core/logic/prayer_time_state.dart';
import 'alarm_active.dart';
import '../../../widget/prayer_time_error_widget.dart';
import '../../../widget/prayer_time_loading_widget.dart';
import 'next_prayer.dart';
import 'prayer_at.dart';
import 'timer_for_next_prayer.dart';

class ConrtainerOfNextPrayreBuilder extends StatelessWidget {
  const ConrtainerOfNextPrayreBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
      builder: (context, state) {
        if (state is PrayerTimeLoading) {
          return Container(
            height: min(250.h, 300),
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
            child: const PrayerTimeLoadingWidget(text: 'loading prayer ...'),
          );
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
          log(
            'nextPrayerTime in ConrtainerOfNextPrayreBuilder: $nextPrayerTime',
          );
          return Container(
            height: min(250.h, 300),
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
                PrayerAtTime(
                  nextPrayerTimes: nextPrayerTime,
                  nextPrayer: nextPrayer,
                ),
                const Spacer(),
                const AlarmActive(),
                const Spacer(),
              ],
            ),
          );
        } else {
          return Container(
            height: min(250.h, 300),
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
