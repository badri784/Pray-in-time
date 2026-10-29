import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/Route/route.dart';
import '../../../../core/helper/extensionss.dart';
import '../../../../core/logic/prayer_time_cubit.dart';
import '../../../../core/logic/prayer_time_state.dart';
import '../notification_access/widget/allow_notification_button.dart';
import '../notification_access/widget/notification_access_header.dart';
import 'widget/location_access_background.dart';
import 'widget/location_access_texts.dart';
import 'widget/location_ambient_backlight.dart';
import 'widget/location_bottom_watermark.dart';
import 'widget/location_top_watermark.dart';

class LoactionAccess extends StatelessWidget {
  const LoactionAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090b15),
      body: SafeArea(
        child: Stack(
          children: [
            const NotificationAccessHeader(),
            const LocationTopWatermark(),
            const LocationAmbientBacklight(),
            const LocationAccessBackground(),
            const LocationBottomWatermark(),
            Positioned(
              left: 0,
              right: 0,
              bottom: 120,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const LocationAccessTexts(),
                    const SizedBox(height: 8),
                    BlocConsumer<PrayerTimeCubit, PrayerTimeState>(
                      builder: (context, state) {
                        if (state is PrayerTimeLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return AllowButtonWidget(
                          text: 'Enaple Location Access',
                          onpressed: () async {
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.setBool('isFirstLaunch', false);
                            await context
                                .read<PrayerTimeCubit>()
                                .getLoactionPermisons();
                            if (!context.mounted) return;
                            context.pushReplacementName(Routes.homeScreen);
                          },
                        );
                      },
                      listener: (context, state) async {
                        if (state is LoactionPermissionGranted) {
                          // final SharedPreferences prefs =
                          //     await SharedPreferences.getInstance();
                          // await prefs.setBool('isFirstLaunch', false);
                          context.pushReplacementName(Routes.homeScreen);
                        }
                        if (state is PrayerTimeError) {
                          SnackBar(content: Text(state.message));
                        }
                        const SizedBox.shrink();
                        // AllowButtonWidget(
                        //   text: 'Enaple Location Access',
                        //   onpressed: () async {
                        //     await context
                        //         .read<PrayerTimeCubit>()
                        //         .getLoactionPermisons();
                        //     if (!context.mounted) return;
                        //     context.pushReplacementName(Routes.homeScreen);
                        //   },
                        // );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
