import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/localization/l10n_extension.dart';
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

  Future<void> _sendEmail(BuildContext context) async {
    final uri = Uri(
      scheme: 'mailto',
      path: _contactEmail,
      queryParameters: {
        'subject': context.l10n.privacyEmailSubject,
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
    final l10n = context.l10n;
    final secondaryColor = Theme.of(context).colorScheme.secondary;

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: AppColors.darkBackground,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          l10n.privacyPolicy,
          style: context.adaptiveFont(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 16.w),
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

            PrivacyPolicyCard(
              icon: Icons.info_outline_rounded,
              title: l10n.privacyOverviewTitle,
              content: l10n.privacyOverviewContent,
            ),
            const Gap(16),

            PrivacyPolicyCard(
              icon: Icons.location_on_outlined,
              title: l10n.privacyLocationTitle,
              content: l10n.privacyLocationContent,
            ),
            const Gap(16),

            PrivacyPolicyCard(
              icon: Icons.notifications_active_outlined,
              title: l10n.privacyAlarmsTitle,
              content: l10n.privacyAlarmsContent,
            ),
            const Gap(16),

            PrivacyPolicyCard(
              icon: Icons.save_outlined,
              title: l10n.privacyStorageTitle,
              content: l10n.privacyStorageContent,
            ),
            const Gap(16),

            PrivacyPolicyCard(
              icon: Icons.shield_outlined,
              title: l10n.privacyThirdPartyTitle,
              content: l10n.privacyThirdPartyContent,
            ),
            const Gap(16),

            const PrivacyPermissionsCard(),
            const Gap(24),

            PrivacyContactCard(
              contactEmail: _contactEmail,
              onSendEmail: () => _sendEmail(context),
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
