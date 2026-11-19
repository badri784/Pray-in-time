import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/localization/l10n_extension.dart';
import 'ambr_container.dart';
import 'settings_listtile.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  Future<void> saveCityName(String cityName) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('cityName', cityName);
    } catch (e) {
      debugPrint('Failed to save city name: $e');
    }
  }

  Future<String> getCityName() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final double? lat = prefs.getDouble('saved_lat');
      final double? lng = prefs.getDouble('saved_lng');
      final Geocoding geocoding = Geocoding();
      final List<Placemark> placemarks = await geocoding
          .placemarkFromCoordinates(lat!, lng!)
          .timeout(const Duration(seconds: 5));
      if (placemarks.isNotEmpty) {
        final Placemark place = placemarks.first;
        final String area = place.administrativeArea ?? '';
        final String country = place.country ?? '';
        if (area.isNotEmpty && country.isNotEmpty) {
          return '$area, $country';
        }
      }
    } catch (e) {
      return '';
    }
    return '';
  }

  Future<String?> _loadSavedCity() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? cityname = prefs.getString('cityName');
    log('City Name In location setting: $cityname');
    if (cityname == null ||
        cityname.trim().isEmpty ||
        cityname == 'Unknown Location') {
      final String fetched = await getCityName();
      if (fetched.isNotEmpty) {
        await saveCityName(fetched);
        return fetched;
      }
      return null;
    }
    return cityname;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.locationSection,
          style: context.adaptiveFont(
            color: Colors.white.withValues(alpha: 0.4),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Gap(8),
        Material(
          color: const Color(0xff121829),
          borderRadius: BorderRadius.circular(12.r),
          child: FutureBuilder<String?>(
            future: _loadSavedCity(),
            builder: (context, snapshot) {
              final String city =
                  snapshot.connectionState == ConnectionState.waiting
                  ? l10n.loading
                  : (snapshot.data ?? l10n.cityNotFound);
              return ListTileSetting(
                text: l10n.currentLocation,
                subtitle: l10n.autoDetectSubtitle(city),
                leading: const AmberContainer(icon: Icons.location_on),
                trailing: const Icon(Icons.done_sharp),
                textStyle: context.adaptiveFont(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
                subtitleStyle: context.adaptiveFont(
                  color: Colors.white.withValues(alpha: 0.4),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
