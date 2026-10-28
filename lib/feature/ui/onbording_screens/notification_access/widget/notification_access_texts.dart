import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/helper/font_weight_helper.dart';

class NotificationAccessTexts extends StatelessWidget {
  const NotificationAccessTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Never Miss A Prayer',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Allow notifications to wake up your screen and\nhear the beautiful Adhan at prayer times',
          textAlign: TextAlign.center,
          style: GoogleFonts.libertinusSans(
            fontSize: 16,
            fontWeight: FontWeightHelper.regular,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

