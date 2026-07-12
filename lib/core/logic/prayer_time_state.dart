import 'package:adhan/adhan.dart';

abstract class PrayerTimeState {}

class PrayerTimeInitial extends PrayerTimeState {}

class PrayerTimeLoading extends PrayerTimeState {}

class PrayerTimeLoaded extends PrayerTimeState {
  PrayerTimeLoaded(this.prayerTimes);
  final PrayerTimes prayerTimes;
}

class PrayerTimeError extends PrayerTimeState {
  PrayerTimeError(this.message);
  final String message;
}
