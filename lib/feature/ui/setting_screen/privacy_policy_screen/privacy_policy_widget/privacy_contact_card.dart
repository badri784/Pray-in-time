import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

import '../../../../../core/localization/l10n_extension.dart';
import '../../../../../core/theming/app_color.dart';

class PrivacyContactCard extends StatelessWidget {
  const PrivacyContactCard({
    super.key,
    required this.onSendEmail,
    this.contactEmail = 'aelbadri23@gmail.com',
  });

  final VoidCallback onSendEmail;
  final String contactEmail;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final accentColor = Theme.of(context).colorScheme.secondary;

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xff121829),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: accentColor.withValues(alpha: 0.25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.privacyQuestionsTitle,
            style: context.adaptiveFont(
              color: Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(6),
          Text(
            l10n.privacyQuestionsDesc,
            style: context.adaptiveFont(
              color: Colors.white.withValues(alpha: 0.65),
              fontSize: 12.sp,
              height: 1.35,
            ),
          ),
          const Gap(14),
          ElevatedButton.icon(
            onPressed: onSendEmail,
            icon: const Icon(
              Icons.email_outlined,
              color: Colors.white,
              size: 18,
            ),
            label: Text(
              l10n.privacyEmailButton(contactEmail),
              style: context.adaptiveFont(
                color: Colors.white,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryEmerald,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}
