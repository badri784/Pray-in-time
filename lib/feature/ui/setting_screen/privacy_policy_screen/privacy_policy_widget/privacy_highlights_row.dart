import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

import '../../../../../core/localization/l10n_extension.dart';
import '../../../../../core/theming/app_color.dart';
import '../../../../../core/utils/responsive_helper.dart';

class PrivacyHighlightsRow extends StatelessWidget {
  const PrivacyHighlightsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final secondaryColor = Theme.of(context).colorScheme.secondary;

    return Row(
      children: [
        Expanded(
          child: _buildBadge(
            context: context,
            icon: Icons.cloud_off_rounded,
            label: l10n.privacyBadgeOffline,
            color: secondaryColor,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _buildBadge(
            context: context,
            icon: Icons.no_accounts_rounded,
            label: l10n.privacyBadgeNoAccounts,
            color: AppColors.primaryEmerald,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _buildBadge(
            context: context,
            icon: Icons.block_rounded,
            label: l10n.privacyBadgeZeroAds,
            color: const Color(0xFF3897F0),
          ),
        ),
      ],
    );
  }

  Widget _buildBadge({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: const Color(0xff121829),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20.clampSp()),
          const Gap(6),
          Text(
            label,
            style: context.adaptiveFont(
              color: Colors.white,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
