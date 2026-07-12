import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  PrayerTimeCubit() : super(PrayerTimeInitial());

  Future<void> getPrayerTimes() async {
    emit(PrayerTimeLoading());
    try {
      bool serviceEnabled;
      LocationPermission permission;
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        debugPrint('❌ Location services are disabled.');
        emit(PrayerTimeError('Location services are disabled.'));
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
        debugPrint('❌ Location permissions are permanently denied.');
        emit(
          PrayerTimeError(
            'Location permissions are permanently denied, we cannot request permissions.',
          ),
        );
        return;
      }
      Position? position = await Geolocator.getLastKnownPosition();
      debugPrint('📍 Last known position: $position');
      if (position == null) {
        try {
          position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.medium,
            timeLimit: const Duration(seconds: 30),
          );
          debugPrint('📍 Current position: $position');
        } on TimeoutException catch (e) {
          debugPrint('⏰ GPS timeout: $e — using default Cairo coordinates');
          position = null;
        }
      }
      final Coordinates myCoordinates;
      if (position != null) {
        myCoordinates = Coordinates(position.latitude, position.longitude);
      } else {
        debugPrint(
          '📍 Using fallback Cairo coordinates (30.0444, 31.2357) When GPS is not available',
        );
        myCoordinates = Coordinates(30.0444, 31.2357);
      }
      final CalculationParameters params = CalculationMethod.egyptian
          .getParameters();
      params.madhab = Madhab.shafi;
      final date = DateComponents.from(DateTime.now());
      final prayerTimes = PrayerTimes(myCoordinates, date, params);
      emit(PrayerTimeLoaded(prayerTimes));
    } catch (e, stackTrace) {
      debugPrint('❌ Failed to load prayer times:');
      debugPrint('   Error type: ${e.runtimeType}');
      debugPrint('   Error: $e');
      debugPrint('   StackTrace: $stackTrace');
      emit(PrayerTimeError('Failed to load prayer times: $e'));
    }
  }
}
