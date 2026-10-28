import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/helper/font_weight_helper.dart';

class LocationAccessTexts extends StatelessWidget {
  const LocationAccessTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Accurate Prayer Times',
          textAlign: TextAlign.center,
          style: GoogleFonts.libertinusSans(
            fontSize: 24,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          textAlign: TextAlign.center,
          'Please allow location access to calculate exact\nprayer times for your city',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white.withValues(alpha: 0.40),
          ),
        ),
      ],
    );
  }
}

