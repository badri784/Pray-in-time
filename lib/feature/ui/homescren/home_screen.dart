import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'container_home_screen/container_next_prayer_builder.dart';
import 'home_widget/daily_prayer.dart';
import 'home_widget/hijri_date.dart';
import 'home_widget/home_app_bar.dart';
import 'home_widget/prayer_time_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: const HomeAppBar(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HijriDateWidget(),
              SizedBox(height: 25.h),
              const ConrtainerOfNextPrayreBuilder(),
              SizedBox(height: 8.h),
              const DailyPrayerSchedule(),
              SizedBox(height: 8.h),
              const PrayerTimeWidget(),
              Align(
                alignment: Alignment.bottomCenter,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Pray in Time ',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      const TextSpan(text: '.. Alarms Armed'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
