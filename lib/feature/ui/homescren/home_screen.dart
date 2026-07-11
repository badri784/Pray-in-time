import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:pray_in_time/feature/ui/homescren/home_widget/container_next_prayer.dart';
import 'package:pray_in_time/feature/ui/homescren/home_widget/daily_prayer.dart';
import 'package:pray_in_time/feature/ui/homescren/home_widget/hijri_date.dart';
import 'package:pray_in_time/feature/ui/homescren/home_widget/home_app_bar.dart';
import 'package:pray_in_time/feature/ui/homescren/home_widget/prayer_time_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HomeAppBar(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HijriDateWidget(),
            SizedBox(height: 25.h),
            const ConrtainerOfNextPrayre(),
            SizedBox(height: 8.h),
            const DailyPrayerSchedule(),
            SizedBox(height: 8.h),
            const PrayerTimeWidget(),
          ],
        ),
      ),
    );
  }
}
