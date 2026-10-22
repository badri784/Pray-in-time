// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/logic/prayer_time_cubit.dart';
import '../../../../core/logic/prayer_time_state.dart';
import '../../../widget/prayer_time_error_widget.dart';
import 'prayer_time_list_tile.dart';
import '../../../widget/prayer_time_loading_widget.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class PrayerTimeWidget extends StatelessWidget {
  const PrayerTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
      builder: ((context, state) {
        if (state is PrayerTimeLoading) {
          return Shimmer(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.08),
            child: const PrayerTimeLoadingWidget(
              text: 'loading prayer times...',
            ),
          );
        } else if (state is PrayerTimeError) {
          return PrayerTimeErrorWidget(message: state.message);
        } else if (state is PrayerTimeLoaded) {
          return PrayerTimeListTile(prayerTimes: state.prayerTimes);
        }
        return const SizedBox.shrink();
      }),
    );
  }
}
