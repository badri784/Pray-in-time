import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import '../../core/utils/responsive_helper.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PrayerTimeLoadingWidget extends StatelessWidget {
  const PrayerTimeLoadingWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingAnimationWidget.threeArchedCircle(
              color: Theme.of(context).colorScheme.primary,
              size: 20.clampSp(),
            ),
            SizedBox(height: 10.h),
            Text(text),
          ],
        ),
      ),
    );
  }
}
