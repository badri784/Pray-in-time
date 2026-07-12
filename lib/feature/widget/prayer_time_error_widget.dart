import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/logic/prayer_time_cubit.dart';

class PrayerTimeErrorWidget extends StatelessWidget {
  const PrayerTimeErrorWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Column(
        children: [
          const Icon(Icons.location_off, color: Colors.red, size: 30),
          const SizedBox(height: 10),
          Builder(
            builder: (context) {
              String errorMessage = message;
              if (errorMessage == 'Location services are disabled.') {
                errorMessage = 'Please turn on location';
              } else if (errorMessage == 'Location permissions are denied') {
                errorMessage = 'Please turn on location';
              } else if (errorMessage ==
                  'Location permissions are permanently denied, we cannot request permissions.') {
                errorMessage = 'Location permissions are permanently denied';
              }
              return Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red),
              );
            },
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
            child: const Text('Retry agine'),
          ),
        ],
      ),
    );
  }
}
