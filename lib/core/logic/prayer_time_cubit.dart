import 'dart:developer';
import 'package:adhan/adhan.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../alarm.dart';
import 'prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  PrayerTimeCubit() : super(PrayerTimeInitial());

  static const String errLocationDisabled = 'location_disabled';
  static const String errLocationDenied = 'location_denied';
  static const String errLocationPermanentlyDenied =
      'location_permanently_denied';
  static const String errLoadCity = 'load_city_error';
  static const String errLoadPrayerTimes = 'load_prayer_times_error';

  Future<void> getLoactionPermisons() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      debugPrint('Location services are disabled.');
      emit(PrayerTimeError(errLocationDisabled));
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(PrayerTimeError(errLocationDenied));
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      emit(PrayerTimeError(errLocationPermanentlyDenied));
      return;
    }
  }

  Future<void> getMyCoordinates() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final double? getSavedLat = prefs.getDouble('saved_lat');
      final double? getSavedLng = prefs.getDouble('saved_lng');
      if (getSavedLng == null || getSavedLat == null) {
        await getPrayerTimes();
      } else {
        final Coordinates myCoordinates = Coordinates(getSavedLat, getSavedLng);
        final CalculationParameters params = buildPrayerParams();
        final DateComponents date = DateComponents.from(DateTime.now());
        final PrayerTimes prayerTimes = PrayerTimes(
          myCoordinates,
          date,
          params,
        );
        emit(PrayerTimeLoaded(prayerTimes));
        schedulePrayerAlarms(myCoordinates);
      }
    } catch (massage) {
      emit(PrayerTimeError(massage.toString()));
    }
  }

  Future<void> getPrayerTimes() async {

    emit(PrayerTimeLoading());
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final double? savedLat = prefs.getDouble('saved_lat');
      final double? savedLng = prefs.getDouble('saved_lng');
      log('saved loaction ======= $savedLat');
      log('saved loaction ======= $savedLng');

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

              timeLimit: const Duration(seconds: 5),
            );
            debugPrint('Current position: $position');
          } catch (e) {
            debugPrint(
              'GPS unavailable: $e — using saved or fallback coordinates',
            );
            // position = null;
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
        emit(PrayerTimeError(errLocationDisabled));
        return;
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
    } catch (e) {
      emit(PrayerTimeError(errLoadPrayerTimes));
    }
  }
}
