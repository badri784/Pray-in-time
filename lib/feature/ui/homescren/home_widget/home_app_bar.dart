import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:intl/intl.dart';

import '../../../../core/localization/l10n_extension.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../setting_screen/setting_screen.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key, this.onSettingsTap});

  final VoidCallback? onSettingsTap;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  late DateTime _now;
  Timer? _clockTimer;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _clockTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      if (mounted) {
        setState(() {
          _now = DateTime.now();
        });
      }
    });
  }

  @override
  void dispose() {
    _clockTimer?.cancel();
    super.dispose();
  }

  TextStyle _subtitleStyle(BuildContext context) => TextStyle(
    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
    fontSize: 12.clampSp(),
  );

  @override
  Widget build(BuildContext context) {
    final localeCode = context.localeCode;
    final formattedDate = DateFormat.yMMMMd(localeCode).format(_now);
    final weekDay = DateFormat('EEEE', localeCode).format(_now);
    final formattedClock = DateFormat.jm(localeCode).format(_now);
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLocationRow(context, colorScheme),
              SizedBox(height: 2.h),
              _buildDateRow(weekDay, formattedDate),
            ],
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.access_time,
              color: colorScheme.secondary,
              size: 15.clampSp(),
            ),
            SizedBox(width: 4.w),
            Text(
              formattedClock,
              style: TextStyle(
                color: colorScheme.secondary,
                fontSize: 14.clampSp(),
              ),
            ),
          ],
        ),
        SizedBox(width: 11.w),
        _buildSettingsButton(colorScheme),
      ],
    );
  }

  Widget _buildLocationRow(BuildContext context, ColorScheme colorScheme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.location_on,
          color: colorScheme.secondary,
          size: 20.clampSp(),
        ),
        SizedBox(width: 4.w),
        Flexible(
          child: Text(
            context.l10n.detectedLocation,
            style: TextStyle(
              color: colorScheme.onSurface,
              fontSize: 18.clampSp(),
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildDateRow(String weekDay, String formattedDate) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            '$weekDay • $formattedDate',
            style: _subtitleStyle(context),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsButton(ColorScheme colorScheme) {
    return GestureDetector(
      onTap:
          widget.onSettingsTap ??
          () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingScreen()),
            );
          },
      child: Container(
        padding: EdgeInsets.all(8.clampSp()),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Icon(
          Icons.settings,
          color: colorScheme.secondary,
          size: 24.clampSp(),
        ),
      ),
    );
  }
}
