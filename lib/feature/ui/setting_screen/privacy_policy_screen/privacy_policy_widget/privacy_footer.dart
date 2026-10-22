import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyFooter extends StatelessWidget {
  const PrivacyFooter({
    super.key,
    this.version = 'Pray in Time • Version 1.0.0',
    this.lastUpdated = 'Last Updated: October 2026',
  });

  final String version;
  final String lastUpdated;

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).colorScheme.secondary;

    return Center(
      child: Column(
        children: [
          Text(
            version,
            style: GoogleFonts.inter(
              color: secondaryColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(4),
          Text(
            lastUpdated,
            style: GoogleFonts.inter(
              color: Colors.white.withOpacity(0.4),
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
