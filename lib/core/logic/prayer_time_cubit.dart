import 'dart:async';
import 'dart:developer';

import 'package:adhan/adhan.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
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
        debugPrint('❌ Location permissions are denied.');
        emit(PrayerTimeError(errLocationDenied));
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      debugPrint('Location permissions are permanently denied.');
      emit(PrayerTimeError(errLocationPermanentlyDenied));
      return;
    }
  }

  Future<void> saveCityName(String cityName) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('cityName', cityName);
    } catch (e) {
      debugPrint('Failed to save city name: $e');
      emit(PrayerTimeError(errLoadCity));
    }
  }

  Future<String> getCityName(double lat, double lon) async {
    try {
      final Geocoding geocoding = Geocoding();
      final List<Placemark> placemarks = await geocoding
          .placemarkFromCoordinates(lat, lon);

      if (placemarks.isNotEmpty) {
        final Placemark place = placemarks.first;
        final String area = place.administrativeArea ?? '';
        final String country = place.country ?? '';
        if (area.isNotEmpty && country.isNotEmpty) {
          return '$area, $country';
        } else if (area.isNotEmpty) {
          return area;
        } else if (country.isNotEmpty) {
          return country;
        }
      }
    } catch (e) {
      return '';
    }
    return '';
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
        final String cityName = await getCityName(
          position.latitude,
          position.longitude,
        );
        log('City Name Of User: $cityName');
        if (cityName.isNotEmpty) {
          await saveCityName(cityName);
        }
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
      emit(PrayerTimeError(errLoadPrayerTimes));
    }
  }
}
