import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hijri_date/hijri.dart';
import '../../../../core/utils/responsive_helper.dart';

class HijriDateWidget extends StatelessWidget {
  const HijriDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final todayHijri = HijriDate.now();

    return Text(
      todayHijri.fullDate(),
      style: GoogleFonts.inter(
        fontSize: 14.clampSp(),
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
