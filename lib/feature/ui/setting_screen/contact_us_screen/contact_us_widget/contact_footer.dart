import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactFooter extends StatelessWidget {
  const ContactFooter({
    super.key,
    this.appName = 'Pray in Time',
    this.subtitle = 'We usually reply within 24 hours',
  });

  final String appName;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).colorScheme.secondary;

    return Center(
      child: Column(
        children: [
          Text(
            appName,
            style: GoogleFonts.inter(
              color: secondaryColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(4),
          Text(
            subtitle,
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
