import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/helper/font_weight_helper.dart';
import '../../../../../core/localization/l10n_extension.dart';

class LocationAccessTexts extends StatelessWidget {
  const LocationAccessTexts({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          l10n.onboardingLocationTitle,
          textAlign: TextAlign.center,
          style: context.isArabic
              ? GoogleFonts.cairo(
                  fontSize: 24,
                  fontWeight: FontWeightHelper.bold,
                  color: Colors.white,
                )
              : GoogleFonts.libertinusSans(
                  fontSize: 24,
                  fontWeight: FontWeightHelper.bold,
                ),
        ),
        const SizedBox(height: 8),
        Text(
          l10n.onboardingLocationSubtitle,
          textAlign: TextAlign.center,
          style: context.adaptiveFont(
            fontSize: 16,
            color: Colors.white.withValues(alpha: 0.40),
          ),
        ),
      ],
    );
  }
}
