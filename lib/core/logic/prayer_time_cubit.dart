import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../alarm.dart';
import 'prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  PrayerTimeCubit() : super(PrayerTimeInitial());

  Future<void> getLoactionPermisons() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      debugPrint('Location services are disabled.');
      emit(
        PrayerTimeError(
          'Location services are disabled, please turn on location permissions',
        ),
      );
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        debugPrint('❌ Location permissions are denied.');
        emit(PrayerTimeError('Location permissions are denied'));
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      debugPrint('Location permissions are permanently denied.');
      emit(
        PrayerTimeError(
          'Location permissions are permanently denied, we cannot request permissions.',
        ),
      );
      return;
    }
  }

  Future<void> getPrayerTimes() async {
    emit(PrayerTimeLoading());
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final double? savedLat = prefs.getDouble('saved_lat');
      final double? savedLng = prefs.getDouble('saved_lng');

      Position? position;
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied && savedLat == null) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        position = await Geolocator.getLastKnownPosition();
        debugPrint('Last known position: $position');
        if (position == null && savedLat == null) {
          try {
            position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high,
              timeLimit: const Duration(seconds: 60),
            );
            debugPrint('Current position: $position');
          } catch (e) {
            debugPrint(
              'GPS unavailable: $e — using saved or fallback coordinates',
            );
            position = null;
          }
        }
      }

      final Coordinates myCoordinates;
      if (position != null) {
        await prefs.setDouble('saved_lat', position.latitude);
        await prefs.setDouble('saved_lng', position.longitude);
        myCoordinates = Coordinates(position.latitude, position.longitude);
      } else if (savedLat != null && savedLng != null) {
        myCoordinates = Coordinates(savedLat, savedLng);
      } else {
        myCoordinates = Coordinates(30.0444, 31.2357); // Cairo fallback
      }

      final CalculationParameters params = buildPrayerParams();
      final DateComponents date = DateComponents.from(DateTime.now());
      final PrayerTimes prayerTimes = PrayerTimes(myCoordinates, date, params);

      emit(PrayerTimeLoaded(prayerTimes));

      try {
        await schedulePrayerAlarms(myCoordinates);
      } catch (alarmError) {
        debugPrint('⚠️ Failed to schedule alarms: $alarmError');
      }
    } catch (e, stackTrace) {
      debugPrint('❌ Failed to load prayer times: $e\n$stackTrace');
      emit(PrayerTimeError('Failed to load prayer times: $e'));
    }
  }
}
