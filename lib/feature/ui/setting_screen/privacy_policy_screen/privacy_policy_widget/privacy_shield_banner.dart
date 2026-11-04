import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

import '../../../../../core/localization/l10n_extension.dart';
import '../../../../../core/theming/app_color.dart';
import '../../../../../core/utils/responsive_helper.dart';

class PrivacyShieldBanner extends StatelessWidget {
  const PrivacyShieldBanner({
    super.key,
    this.title,
    this.description,
  });

  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: const Color(0xff121829),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.primaryEmerald.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: AppColors.primaryEmerald.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.security_rounded,
              color: AppColors.primaryEmerald,
              size: 28.clampSp(),
            ),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? l10n.privacyShieldTitle,
                  style: context.adaptiveFont(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(4),
                Text(
                  description ?? l10n.privacyShieldDesc,
                  style: context.adaptiveFont(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 12.sp,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
