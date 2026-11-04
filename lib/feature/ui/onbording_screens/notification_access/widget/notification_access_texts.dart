import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/helper/font_weight_helper.dart';
import '../../../../../core/localization/l10n_extension.dart';

class NotificationAccessTexts extends StatelessWidget {
  const NotificationAccessTexts({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          l10n.onboardingNotificationTitle,
          textAlign: TextAlign.center,
          style: context.adaptiveFont(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          l10n.onboardingNotificationSubtitle,
          textAlign: TextAlign.center,
          style: context.isArabic
              ? GoogleFonts.cairo(
                  fontSize: 16,
                  fontWeight: FontWeightHelper.regular,
                  color: Colors.white,
                )
              : GoogleFonts.libertinusSans(
                  fontSize: 16,
                  fontWeight: FontWeightHelper.regular,
                  color: Colors.white,
                ),
        ),
      ],
    );
  }
}
