import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../../../../../core/localization/l10n_extension.dart';
import '../../setting_widgets/ambr_container.dart';

class ContactActionTile extends StatelessWidget {
  const ContactActionTile({
    super.key,
    required this.icon,
    this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.trailing,
  });

  final IconData icon;
  final Color? iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      leading: AmberContainer(icon: icon, iconColor: iconColor),
      title: Text(
        title,
        style: context.adaptiveFont(
          color: Colors.white,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: context.adaptiveFont(
          color: Colors.white.withValues(alpha: 0.5),
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: trailing,
    );
  }
}
