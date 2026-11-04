import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import 'core/Route/app_router.dart';
import 'core/Route/route.dart';
import 'core/localization/l10n_extension.dart';
import 'core/localization/locale_cubit.dart';
import 'core/theming/app_theme.dart';

class PrayerInTimeApp extends StatelessWidget {
  const PrayerInTimeApp({
    super.key,
    required this.appRouter,
    required this.isFirstLaunch,
  });

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
            return BlocBuilder<LocaleCubit, Locale>(
              builder: (context, locale) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  onGenerateTitle: (ctx) => ctx.l10n.appTitle,
                  locale: locale,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  theme: AppTheme.lightTheme(locale),
                  darkTheme: AppTheme.darkTheme(locale),
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
      },
    );
  }
}
