import 'package:flutter/material.dart';

class ListTileSetting extends StatelessWidget {
  const ListTileSetting({
    super.key,
    required this.text,
    this.subtitle,
    this.trailing,
    this.leading,
    this.textStyle,
    this.subtitleStyle,
    this.ontap,
    this.tapOnTrailing,
  });
  final String text;
  final String? subtitle;
  final Widget? trailing;
  final Widget? leading;
  final TextStyle? textStyle;
  final TextStyle? subtitleStyle;
  final VoidCallback? ontap;
  final VoidCallback? tapOnTrailing;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      title: Text(text, style: textStyle),
      subtitle: subtitle != null ? Text(subtitle!, style: subtitleStyle) : null,
      trailing: GestureDetector(onTap: tapOnTrailing, child: trailing),
      leading: leading,
    );
  }
}
