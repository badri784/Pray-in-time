// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:pray_in_time/core/logic/prayer_time_cubit.dart';
import 'package:pray_in_time/core/logic/prayer_time_state.dart';
import 'package:pray_in_time/feature/ui/homescren/home_widget/prayer_time_list_tile.dart';

class PrayerTimeWidget extends StatelessWidget {
  const PrayerTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrayerTimeCubit()..getPrayerTimes(),
      child: BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
        builder: ((context, state) {
          if (state is PrayerTimeLoading) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(height: 10.h),
                    const Text('جاري حساب مواقيت الصلاه...'),
                  ],
                ),
              ),
            );
          } else if (state is PrayerTimeError) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Column(
                children: [
                  const Icon(Icons.location_off, color: Colors.red, size: 30),
                  const SizedBox(height: 10),
                  Builder(
                    builder: (context) {
                      String errorMessage = state.message;
                      if (errorMessage == 'Location services are disabled.') {
                        errorMessage = 'Please turn on location';
                      } else if (errorMessage ==
                          'Location permissions are denied') {
                        errorMessage = 'Please turn on location';
                      } else if (errorMessage ==
                          'Location permissions are permanently denied, we cannot request permissions.') {
                        errorMessage =
                            'Location permissions are permanently denied';
                      }
                      return Text(
                        errorMessage,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      context.read<PrayerTimeCubit>().getPrayerTimes();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade100,
                      foregroundColor: Colors.red.shade900,
                      elevation: 0,
                    ),
                    child: const Text('Retry agine'),
                  ),
                ],
              ),
            );
          } else if (state is PrayerTimeLoaded) {
            return PrayerTimeListTile(prayerTimes: state.prayerTimes);
          }

          return const SizedBox.shrink();
        }),
      ),
    );
  }
}
