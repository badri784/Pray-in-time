import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/theming/app_color.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../setting_widgets/ambr_container.dart';
import 'privacy_policy_widget/privacy_contact_card.dart';
import 'privacy_policy_widget/privacy_footer.dart';
import 'privacy_policy_widget/privacy_highlights_row.dart';
import 'privacy_policy_widget/privacy_permissions_card.dart';
import 'privacy_policy_widget/privacy_policy_card.dart';
import 'privacy_policy_widget/privacy_shield_banner.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  static const String _contactEmail = 'aelbadri23@gmail.com';

  Future<void> _sendEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: _contactEmail,
      queryParameters: {
        'subject': 'Pray in Time - Privacy Inquiry',
      },
    );
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).colorScheme.secondary;

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: AppColors.darkBackground,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Privacy Policy',
          style: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: AmberContainer(
              height: 40.h,
              width: 40.w,
              icon: Icons.verified_user_outlined,
              iconColor: secondaryColor,
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(14.r),
              iconSize: 22.clampSp(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PrivacyShieldBanner(),
            const Gap(20),

            const PrivacyHighlightsRow(),
            const Gap(24),

            const PrivacyPolicyCard(
              icon: Icons.info_outline_rounded,
              title: 'Overview',
              content:
                  'Welcome to Pray in Time. Your privacy is of paramount importance to us. '
                  'This Privacy Policy explains how our application handles your information. '
                  'In short: Pray in Time is designed with a privacy-first, on-device architecture. '
                  'We do not collect, sell, or transmit your personal data.',
            ),
            const Gap(16),

            const PrivacyPolicyCard(
              icon: Icons.location_on_outlined,
              title: 'Location Data & Usage',
              content:
                  'To determine accurate Islamic prayer times (Fajr, Sunrise, Dhuhr, Asr, Maghrib, and Isha) '
                  'and calculate the Qibla direction, the application requests access to your device\'s location.\n\n'
                  '• 100% On-Device: Your GPS coordinates are processed locally using mathematical astronomical algorithms.\n'
                  '• Zero Remote Logging: Your coordinates are never sent to external servers or logged anywhere.\n'
                  '• No Background Tracking: Location is only requested when refreshing prayer schedules.',
            ),
            const Gap(16),

            const PrivacyPolicyCard(
              icon: Icons.notifications_active_outlined,
              title: 'Notifications & Alarms',
              content:
                  'Pray in Time requests notification and alarm permissions to deliver timely Adhan audio '
                  'and prayer alerts.\n\n'
                  '• Scheduling is handled entirely by your device\'s operating system (Android Alarm Manager / Local Notifications).\n'
                  '• No remote push servers are used to trigger adhan times; everything is scheduled offline.',
            ),
            const Gap(16),

            const PrivacyPolicyCard(
              icon: Icons.save_outlined,
              title: 'Preferences & Local Storage',
              content:
                  'Settings such as your chosen Adhan audio, calculation method, juristic rule (Shafi\'i / Hanafi), '
                  'and language are stored locally on your device via SharedPreferences.\n\n'
                  '• No user account or registration is required.\n'
                  '• All stored settings are permanently deleted if you clear app data or uninstall the app.',
            ),
            const Gap(16),

            const PrivacyPolicyCard(
              icon: Icons.shield_outlined,
              title: 'Third-Party Services & Tracking',
              content:
                  'Pray in Time does NOT contain third-party analytics trackers, advertising SDKs, or data brokers. '
                  'We do not monitor your habits, device identifiers, or app usage patterns.',
            ),
            const Gap(16),

            const PrivacyPermissionsCard(),
            const Gap(24),

            PrivacyContactCard(
              contactEmail: _contactEmail,
              onSendEmail: _sendEmail,
            ),
            const Gap(32),

            const PrivacyFooter(),
            const Gap(24),
          ],
        ),
      ),
    );
  }
}
