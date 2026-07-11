import 'package:adhan/adhan.dart';

abstract class PrayerTimeState {}

class PrayerTimeInitial extends PrayerTimeState {}

class PrayerTimeLoading extends PrayerTimeState {}

class PrayerTimeLoaded extends PrayerTimeState {
  final PrayerTimes prayerTimes;

  PrayerTimeLoaded(this.prayerTimes);
}

class PrayerTimeError extends PrayerTimeState {
  final String message;

  PrayerTimeError(this.message);
}
