import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

import '../../../../../core/localization/l10n_extension.dart';

class ContactFooter extends StatelessWidget {
  const ContactFooter({
    super.key,
    this.appName,
    this.subtitle,
  });

  final String? appName;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final secondaryColor = Theme.of(context).colorScheme.secondary;

    return Center(
      child: Column(
        children: [
          Text(
            appName ?? l10n.appTitle,
            style: context.adaptiveFont(
              color: secondaryColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(4),
          Text(
            subtitle ?? l10n.contactReplyTime,
            style: context.adaptiveFont(
              color: Colors.white.withValues(alpha: 0.4),
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
