import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pray_in_time.dart';
import 'simble_bloc_ob.dart';

void main() {
  Bloc.observer = SimbleBlocOb();
  runApp(const PrayerInTimeApp());
}
