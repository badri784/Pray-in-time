import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/theming/app_color.dart';
import '../../../../../core/utils/responsive_helper.dart';

class PrivacyHighlightsRow extends StatelessWidget {
  const PrivacyHighlightsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).colorScheme.secondary;

    return Row(
      children: [
        Expanded(
          child: _buildBadge(
            icon: Icons.cloud_off_rounded,
            label: '100% Offline',
            color: secondaryColor,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _buildBadge(
            icon: Icons.no_accounts_rounded,
            label: 'No Accounts',
            color: AppColors.primaryEmerald,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _buildBadge(
            icon: Icons.block_rounded,
            label: 'Zero Ads',
            color: const Color(0xFF3897F0),
          ),
        ),
      ],
    );
  }

  Widget _buildBadge({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: const Color(0xff121829),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20.clampSp()),
          const Gap(6),
          Text(
            label,
            style: GoogleFonts.inter(
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
