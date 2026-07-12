import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:intl/intl.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key, this.onSettingsTap});

  final VoidCallback? onSettingsTap;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _settingsAnimController;

  @override
  void initState() {
    super.initState();
    _settingsAnimController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _settingsAnimController.dispose();
    super.dispose();
  }

  TextStyle _subtitleStyle(BuildContext context) => TextStyle(
    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
    fontSize: 12.sp,
  );

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat('MMMM d, yyyy').format(now);
    final weekDay = DateFormat('EEEE').format(now);
    final time = DateFormat.jm().format(now);
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLocationRow(colorScheme),
              SizedBox(height: 2.h),
              _buildDateRow(weekDay, formattedDate),
            ],
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.access_time,
              color: Theme.of(context).colorScheme.secondary,
              size: 15.sp,
            ),
            SizedBox(width: 4.w),
            Text(
              time,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
        SizedBox(width: 11.w),
        _buildSettingsButton(colorScheme),
      ],
    );
  }

  Widget _buildLocationRow(ColorScheme colorScheme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.location_on, color: colorScheme.secondary, size: 20.sp),
        SizedBox(width: 4.w),
        Flexible(
          child: Text(
            'Detected Location,',
            style: TextStyle(color: colorScheme.onSurface, fontSize: 20.sp),
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
        Text(weekDay, style: _subtitleStyle(context)),
        SizedBox(width: 11.w),
        Text(formattedDate, style: _subtitleStyle(context)),
      ],
    );
  }

  Widget _buildSettingsButton(ColorScheme colorScheme) {
    return GestureDetector(
      onTap: widget.onSettingsTap,
      child: Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: RotationTransition(
          turns: CurvedAnimation(
            parent: _settingsAnimController,
            curve: Curves.linear,
          ),
          child: Icon(
            Icons.settings,
            color: colorScheme.secondary,
            size: 24.sp,
          ),
        ),
      ),

      //   ),
      // ),
    );
  }
}
