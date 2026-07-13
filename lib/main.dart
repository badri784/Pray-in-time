import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pray_in_time.dart';
import 'simble_bloc_ob.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  Bloc.observer = SimbleBlocOb();
  runApp(const PrayerInTimeApp());
}
