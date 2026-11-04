import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/Route/app_router.dart';
import 'core/localization/locale_cubit.dart';
import 'notification_helper.dart';
import 'pray_in_time.dart';
import 'simble_bloc_ob.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationHelper.init();
  await AndroidAlarmManager.initialize();
  Bloc.observer = SimbleBlocOb();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
  final Locale initialLocale = await LocaleCubit.loadInitialLocale();

  runApp(
    BlocProvider<LocaleCubit>(
      create: (_) => LocaleCubit(initialLocale),
      child: PrayerInTimeApp(
        appRouter: AppRouter(),
        isFirstLaunch: isFirstLaunch,
      ),
    ),
  );
}
