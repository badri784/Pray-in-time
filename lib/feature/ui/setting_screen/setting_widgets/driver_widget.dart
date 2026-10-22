import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class DriverWidget extends StatelessWidget {
  const DriverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 20.w),
        Expanded(
          child: Divider(
            height: 1,
            thickness: 1,
            color: Colors.white.withOpacity(0.06),
          ),
        ),
        SizedBox(width: 20.w),
      ],
    );
  }
}
