import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/localization/l10n_extension.dart';
import '../../core/logic/prayer_time_cubit.dart';

class PrayerTimeErrorWidget extends StatelessWidget {
  const PrayerTimeErrorWidget({super.key, required this.message});
  final String message;

  static String resolveErrorMessage(BuildContext context, String code) {
    final l10n = context.l10n;
    switch (code) {
      case PrayerTimeCubit.errLocationDisabled:
      case 'Location services are disabled.':
        return l10n.errorLocationDisabled;
      case PrayerTimeCubit.errLocationDenied:
      case 'Location permissions are denied':
        return l10n.errorLocationDenied;
      case PrayerTimeCubit.errLocationPermanentlyDenied:
      case 'Location permissions are permanently denied, we cannot request permissions.':
        return l10n.errorLocationPermanentlyDenied;
      case PrayerTimeCubit.errLoadCity:
        return l10n.errorLoadCityName;
      case PrayerTimeCubit.errLoadPrayerTimes:
        return l10n.errorLoadPrayerTimes;
      default:
        return code;
    }
  }

  @override
  Widget build(BuildContext context) {
    final String errorMessage = resolveErrorMessage(context, message);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.location_off, color: Colors.red, size: 30),
          const SizedBox(height: 10),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: context.adaptiveFont(color: Colors.red, fontSize: 14),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              context.read<PrayerTimeCubit>().getPrayerTimes();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade100,
              foregroundColor: Colors.red.shade900,
              elevation: 0,
            ),
            child: Text(
              context.l10n.retryAgain,
              style: context.adaptiveFont(
                color: Colors.red.shade900,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
