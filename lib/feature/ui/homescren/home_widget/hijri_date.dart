import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hijri_date/hijri.dart';

class HijriDateWidget extends StatelessWidget {
  const HijriDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final todayHijri = HijriDate.now();

    return Text(
      todayHijri.fullDate(),
      style: GoogleFonts.inter(
        fontSize: 14.sp,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
