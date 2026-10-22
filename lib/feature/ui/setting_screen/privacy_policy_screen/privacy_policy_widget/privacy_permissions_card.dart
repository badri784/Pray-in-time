import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/theming/app_color.dart';
import '../../../../../core/utils/responsive_helper.dart';
import '../../setting_widgets/driver_widget.dart';

class PrivacyPermissionsCard extends StatelessWidget {
  const PrivacyPermissionsCard({super.key});

  @override
  Widget build(BuildContext context) {
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
            'PERMISSIONS USED',
            style: GoogleFonts.inter(
              color: Colors.white.withOpacity(0.4),
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.8,
            ),
          ),
          const Gap(12),
          _buildPermissionRow(
            icon: Icons.my_location_rounded,
            title: 'Location (GPS)',
            desc: 'Used solely to calculate prayer schedules and Qibla.',
          ),
          const DriverWidget(),
          _buildPermissionRow(
            icon: Icons.notifications_none_rounded,
            title: 'Notifications',
            desc: 'Used to alert you when prayer time enters.',
          ),
          const DriverWidget(),
          _buildPermissionRow(
            icon: Icons.alarm_rounded,
            title: 'Exact Alarms',
            desc: 'Allows Azan sound to trigger accurately down to the second.',
          ),
        ],
      ),
    );
  }

  Widget _buildPermissionRow({
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
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(2),
                Text(
                  desc,
                  style: GoogleFonts.inter(
                    color: Colors.white.withOpacity(0.6),
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
