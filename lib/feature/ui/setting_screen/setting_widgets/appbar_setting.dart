import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ambr_container.dart';

class AppBarSettings extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Text(
        'Settings',
        style: GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.w700),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: AmberContainer(
            height: 40.h,
            width: 40.w,
            icon: Icons.settings,
            iconColor: Theme.of(context).colorScheme.secondary,
            color: Theme.of(context).colorScheme.surface,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(14.r),
            iconSize: 24,
            padding: 8.r,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
