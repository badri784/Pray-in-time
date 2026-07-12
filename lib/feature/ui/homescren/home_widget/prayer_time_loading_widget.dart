import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PrayerTimeLoadingWidget extends StatelessWidget {
  const PrayerTimeLoadingWidget({super.key});

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
              size: 20.sp,
            ),
            SizedBox(height: 10.h),
            const Text('loading prayer times...'),
          ],
        ),
      ),
    );
  }
}
