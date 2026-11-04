import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

import '../../../../../core/localization/l10n_extension.dart';
import '../../../../../core/utils/responsive_helper.dart';
import '../../setting_widgets/driver_widget.dart';
import 'contact_action_tile.dart';

class ContactMethodsCard extends StatelessWidget {
  const ContactMethodsCard({
    super.key,
    required this.phoneNumber,
    required this.emailAddress,
    required this.onCallPhone,
    required this.onCopyPhone,
    required this.onOpenWhatsApp,
    required this.onSendEmail,
    required this.onCopyEmail,
    required this.onOpenLinkedIn,
  });

  final String phoneNumber;
  final String emailAddress;
  final VoidCallback onCallPhone;
  final VoidCallback onCopyPhone;
  final VoidCallback onOpenWhatsApp;
  final VoidCallback onSendEmail;
  final VoidCallback onCopyEmail;
  final VoidCallback onOpenLinkedIn;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final accentColor = Theme.of(context).colorScheme.secondary;

    return Material(
      color: const Color(0xff121829),
      borderRadius: BorderRadius.circular(16.r),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          const Gap(6),
          // 1. Direct Phone Call
          ContactActionTile(
            icon: Icons.phone_in_talk_rounded,
            title: l10n.callDirectly,
            subtitle: '\u200E$phoneNumber\u200E',
            onTap: onCallPhone,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  tooltip: l10n.copyPhoneTooltip,
                  icon: Icon(
                    Icons.copy_rounded,
                    color: Colors.white.withValues(alpha: 0.5),
                    size: 18.clampSp(),
                  ),
                  onPressed: onCopyPhone,
                ),
                IconButton(
                  tooltip: l10n.callTooltip,
                  icon: Icon(
                    Icons.call_rounded,
                    color: accentColor,
                    size: 20.clampSp(),
                  ),
                  onPressed: onCallPhone,
                ),
              ],
            ),
          ),
          const DriverWidget(),

          // 2. WhatsApp
          ContactActionTile(
            icon: Icons.chat_rounded,
            iconColor: const Color(0xFF25D366),
            title: l10n.whatsappTitle,
            subtitle: l10n.whatsappSubtitle('\u200E+20 150 073 0240\u200E'),
            onTap: onOpenWhatsApp,
            trailing: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: const Color(0xFF25D366).withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    l10n.chatAction,
                    style: context.adaptiveFont(
                      color: const Color(0xFF25D366),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: const Color(0xFF25D366),
                    size: 12.clampSp(),
                  ),
                ],
              ),
            ),
          ),
          const DriverWidget(),

          // 3. Email
          ContactActionTile(
            icon: Icons.alternate_email_rounded,
            title: l10n.sendEmailTitle,
            subtitle: emailAddress,
            onTap: onSendEmail,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  tooltip: l10n.copyEmailTooltip,
                  icon: Icon(
                    Icons.copy_rounded,
                    color: Colors.white.withValues(alpha: 0.5),
                    size: 18.clampSp(),
                  ),
                  onPressed: onCopyEmail,
                ),
                IconButton(
                  tooltip: l10n.composeTooltip,
                  icon: Icon(
                    Icons.send_rounded,
                    color: accentColor,
                    size: 18.clampSp(),
                  ),
                  onPressed: onSendEmail,
                ),
              ],
            ),
          ),
          const DriverWidget(),

          // 4. LinkedIn Profile
          ContactActionTile(
            icon: Icons.business_center_rounded,
            iconColor: const Color(0xFF0A66C2),
            title: l10n.linkedinTitle,
            subtitle: 'ahmed-salah-g63',
            onTap: onOpenLinkedIn,
            trailing: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: const Color(0xFF0A66C2).withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    l10n.connectAction,
                    style: context.adaptiveFont(
                      color: const Color(0xFF3897F0),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Icon(
                    Icons.open_in_new_rounded,
                    color: const Color(0xFF3897F0),
                    size: 14.clampSp(),
                  ),
                ],
              ),
            ),
          ),
          const Gap(6),
        ],
      ),
    );
  }
}
