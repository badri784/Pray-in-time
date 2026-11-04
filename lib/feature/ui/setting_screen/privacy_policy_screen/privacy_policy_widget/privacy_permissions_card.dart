import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

import '../../../../../core/localization/l10n_extension.dart';
import '../../../../../core/theming/app_color.dart';
import '../../../../../core/utils/responsive_helper.dart';
import '../../setting_widgets/driver_widget.dart';

class PrivacyPermissionsCard extends StatelessWidget {
  const PrivacyPermissionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xff121829),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.permissionsUsedHeader,
            style: context.adaptiveFont(
              color: Colors.white.withValues(alpha: 0.4),
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.8,
            ),
          ),
          const Gap(12),
          _buildPermissionRow(
            context: context,
            icon: Icons.my_location_rounded,
            title: l10n.permLocationTitle,
            desc: l10n.permLocationDesc,
          ),
          const DriverWidget(),
          _buildPermissionRow(
            context: context,
            icon: Icons.notifications_none_rounded,
            title: l10n.permNotificationsTitle,
            desc: l10n.permNotificationsDesc,
          ),
          const DriverWidget(),
          _buildPermissionRow(
            context: context,
            icon: Icons.alarm_rounded,
            title: l10n.permExactAlarmsTitle,
            desc: l10n.permExactAlarmsDesc,
          ),
          const DriverWidget(),
          _buildPermissionRow(
            context: context,
            icon: Icons.volume_up_rounded,
            title: l10n.permForegroundMediaTitle,
            desc: l10n.permForegroundMediaDesc,
          ),
          const DriverWidget(),
          _buildPermissionRow(
            context: context,
            icon: Icons.restart_alt_rounded,
            title: l10n.permBootTitle,
            desc: l10n.permBootDesc,
          ),
        ],
      ),
    );
  }

  Widget _buildPermissionRow({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String desc,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: AppColors.primaryEmerald,
            size: 20.clampSp(),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.adaptiveFont(
                    color: Colors.white,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(2),
                Text(
                  desc,
                  style: context.adaptiveFont(
                    color: Colors.white.withValues(alpha: 0.6),
                    fontSize: 12.sp,
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
