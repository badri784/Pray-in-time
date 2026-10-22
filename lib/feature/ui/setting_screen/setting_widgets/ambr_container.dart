import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../../../../core/utils/responsive_helper.dart';

class AmberContainer extends StatelessWidget {
  const AmberContainer({
    super.key,
    this.icon,
    this.iconColor,
    this.color,
    this.borderRadius,
    this.iconSize,
    this.padding,
    this.height,
    this.width,
    this.shape,
  });
  final IconData? icon;
  final double? height;
  final double? width;
  final Color? iconColor;
  final Color? color;
  final BorderRadius? borderRadius;
  final double? iconSize;
  final double? padding;
  final BoxShape? shape;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.w,
      height: 48.h,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.surface,
        shape: shape ?? BoxShape.circle,
        borderRadius: borderRadius,
      ),
      child: Icon(
        icon ?? Icons.settings,
        color: iconColor ?? Theme.of(context).colorScheme.secondary,
        size: iconSize ?? 24.clampSp(),
      ),
    );
  }
}
