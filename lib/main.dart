import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/Route/app_router.dart';
import 'pray_in_time.dart';
import 'simble_bloc_ob.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await NotificationHelper.init();
  // await NotificationHelper.requestPermission();
  await AndroidAlarmManager.initialize();

  Bloc.observer = SimbleBlocOb();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
  runApp(PrayerInTimeApp(appRouter: AppRouter(), isFirstLaunch: isFirstLaunch));
}
