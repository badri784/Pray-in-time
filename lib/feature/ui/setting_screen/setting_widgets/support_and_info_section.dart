import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/responsive_helper.dart';
import '../contact_us_screen/contact_us_screen.dart';
import '../privacy_policy_screen/privacy_policy_screen.dart';
import 'ambr_container.dart';
import 'driver_widget.dart';
import 'settings_listtile.dart';

class SupportAndInfoSection extends StatelessWidget {
  const SupportAndInfoSection({
    super.key,
    this.onTapContactUs,
    this.onTapPrivacyPolicy,
    this.onTapAboutRateUs,
    this.appName = 'Pray in Time',
    this.version = 'v1.0.0',
  });

  final VoidCallback? onTapContactUs;
  final VoidCallback? onTapPrivacyPolicy;
  final VoidCallback? onTapAboutRateUs;
  final String appName;
  final String version;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SUPPORT & INFO',
          style: GoogleFonts.inter(
            color: Colors.white.withOpacity(0.4),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Gap(8),
        Material(
          color: const Color(0xff121829),
          borderRadius: BorderRadius.circular(12.r),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              const Gap(8),
              ListTileSetting(
                ontap:
                    onTapContactUs ??
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ContactUsScreen(),
                        ),
                      );
                    },
                text: 'Contact Us',
                textStyle: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
                leading: const AmberContainer(icon: Icons.comment_outlined),
                trailing: Icon(
                  Icons.keyboard_arrow_down,
                  color: const Color(0xFF4B5B76),
                  size: 22.clampSp(),
                ),
              ),
              const Gap(8),
              const DriverWidget(),
              const Gap(8),
              ListTileSetting(
                ontap:
                    onTapPrivacyPolicy ??
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrivacyPolicyScreen(),
                        ),
                      );
                    },
                text: 'Privacy Policy',
                textStyle: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
                leading: const AmberContainer(icon: Icons.lock),
                trailing: Icon(
                  Icons.keyboard_arrow_down,
                  color: const Color(0xFF4B5B76),
                  size: 22.clampSp(),
                ),
              ),
              const Gap(8),
              const DriverWidget(),
              const Gap(8),
              ListTileSetting(
                ontap: onTapAboutRateUs,
                text: 'About & Rate Us',
                textStyle: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
                leading: const AmberContainer(icon: Icons.star),
                trailing: Icon(
                  Icons.keyboard_arrow_down,
                  color: const Color(0xFF4B5B76),
                  size: 22.clampSp(),
                ),
              ),
              const Gap(8),
            ],
          ),
        ),
        const Gap(8),

        Gap(28.h),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                appName,
                style: GoogleFonts.inter(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(4.h),
              Text(
                version,
                style: GoogleFonts.inter(
                  color: Colors.white.withOpacity(0.4),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
