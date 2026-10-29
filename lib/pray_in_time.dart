import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'core/Route/app_router.dart';
import 'core/Route/route.dart';
import 'core/theming/app_theme.dart';

class PrayerInTimeApp extends StatelessWidget {
  const PrayerInTimeApp({super.key, required this.appRouter, required this.isFirstLaunch});
  final AppRouter appRouter;
  final bool isFirstLaunch;

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
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Prayer in Time',
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode.dark,
              initialRoute: isFirstLaunch
                  ? Routes.notificationAccess
                  : Routes.homeScreen,
              onGenerateRoute: appRouter.generateRoute,
            );
          },
        );
      },
    );
  }
}
