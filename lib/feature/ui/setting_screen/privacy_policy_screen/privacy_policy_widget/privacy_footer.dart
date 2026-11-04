import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

import '../../../../../core/localization/l10n_extension.dart';

class PrivacyFooter extends StatelessWidget {
  const PrivacyFooter({
    super.key,
    this.version,
    this.lastUpdated,
  });

  final String? version;
  final String? lastUpdated;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final secondaryColor = Theme.of(context).colorScheme.secondary;

    return Center(
      child: Column(
        children: [
          Text(
            version ?? l10n.privacyFooterVersion,
            style: context.adaptiveFont(
              color: secondaryColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(4),
          Text(
            lastUpdated ?? l10n.privacyLastUpdated,
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
