import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'core/logic/prayer_time_cubit.dart';
import 'core/theming/app_theme.dart';
import 'feature/ui/homescren/home_screen.dart';

class PrayerInTimeApp extends StatelessWidget {
  const PrayerInTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth > 600;
        final designSize = isTablet
            ? const Size(600, 1024)
            : const Size(390, 884);

        return ScreenUtilPlusInit(
          autoRebuild: false,
          designSize: designSize,
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => PrayerTimeCubit()..getPrayerTimes(),
                ),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Prayer in Time',
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: ThemeMode.dark,
                home: const HomeScreen(),
              ),
            );
          },
        );
      },
    );
  }
}
