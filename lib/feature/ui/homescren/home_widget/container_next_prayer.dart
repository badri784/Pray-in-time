import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class ConrtainerOfNextPrayre extends StatelessWidget {
  const ConrtainerOfNextPrayre({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: const LinearGradient(
          colors: [
            Color(0xff0d0f2f),
            Color(0xff0f1134),
            Color(0xff101239),
            Color(0xff12133e),
            Color(0xff101239),
            Color(0xff0f1134),
            Color(0xff0d0f2f),
          ],
          stops: [0.0, 0.15, 0.35, 0.5, 0.65, 0.85, 1.0],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
      child: null,
    );
  }
}
