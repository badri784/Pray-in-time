import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/responsive_helper.dart';
import 'ambr_container.dart';
import 'driver_widget.dart';
import 'settings_listtile.dart';

class AlarmAndNofiticationSection extends StatelessWidget {
  const AlarmAndNofiticationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ALARM & NOTIFICATION',
          style: GoogleFonts.inter(
            color: Colors.white.withOpacity(0.4),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Gap(12.h),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff121829),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            children: [
              ListTileSetting(
                text: 'Adhan Sounds',
                textStyle: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
                subtitle: 'Default',
                subtitleStyle: GoogleFonts.inter(
                  color: Colors.white.withOpacity(0.4),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
                trailing: Icon(
                  Icons.arrow_drop_down,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 24.clampSp(),
                ),
                leading: const AmberContainer(icon: Icons.notifications),
              ),
              const Gap(4),
              const DriverWidget(),
              const Gap(4),
              ListTileSetting(
                text: 'Adhan Sounds',
                textStyle: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),

                subtitle: 'Default',
                subtitleStyle: GoogleFonts.inter(
                  color: Colors.white.withOpacity(0.4),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),

                trailing: Icon(
                  Icons.arrow_drop_down,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 24.clampSp(),
                ),
                leading: const AmberContainer(icon: Icons.notifications),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
