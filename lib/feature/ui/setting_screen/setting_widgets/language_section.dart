import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ambr_container.dart';
import 'settings_listtile.dart';

class LanguageSection extends StatelessWidget {
  const LanguageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Language',
          style: GoogleFonts.inter(
            color: Colors.white.withOpacity(0.4),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Gap(8),
        Material(
          color: const Color(0xff121829),
          borderRadius: BorderRadius.circular(12.r),
          child: ListTileSetting(
            text: 'Language',
            subtitle: 'English/العربية',
            trailing: Icon(
              Icons.arrow_drop_down,
              color: Theme.of(context).colorScheme.secondary,
            ),
            leading: const AmberContainer(icon: Icons.language, height: 55),
          ),
        ),
      ],
    );
  }
}
