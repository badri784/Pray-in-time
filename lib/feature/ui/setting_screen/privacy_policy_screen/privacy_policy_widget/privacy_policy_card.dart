import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

import '../../../../../core/localization/l10n_extension.dart';
import '../../../../../core/utils/responsive_helper.dart';
import '../../setting_widgets/ambr_container.dart';

class PrivacyPolicyCard extends StatelessWidget {
  const PrivacyPolicyCard({
    super.key,
    required this.icon,
    required this.title,
    required this.content,
  });

  final IconData icon;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xff121829),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AmberContainer(
                icon: icon,
                height: 42.h,
                width: 42.w,
                iconSize: 20.clampSp(),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  title,
                  style: context.adaptiveFont(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const Gap(12),
          Text(
            content,
            style: context.adaptiveFont(
              color: Colors.white.withValues(alpha: 0.75),
              fontSize: 13.sp,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}
