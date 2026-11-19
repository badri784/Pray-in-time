import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../core/localization/l10n_extension.dart';
import '../../core/utils/responsive_helper.dart';

Future<T> runWithLoadingDialog<T>({
  required BuildContext context,
  required String message,
  required Future<T> Function() action,
}) async {
  final NavigatorState rootNavigator = Navigator.of(
    context,
    rootNavigator: true,
  );

  showDialog<void>(
    context: context,
    barrierDismissible: false,
    useRootNavigator: true,
    builder: (dialogContext) {
      final accentColor = Theme.of(dialogContext).colorScheme.secondary;
      return PopScope(
        canPop: false,
        child: AlertDialog(
          backgroundColor: const Color(0xff121829),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
            side: BorderSide(
              color: accentColor.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 22.h,
          ),
          content: Row(
            children: [
              LoadingAnimationWidget.threeArchedCircle(
                color: accentColor,
                size: 28.clampSp(),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  message,
                  style: dialogContext.adaptiveFont(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

  try {
    return await action();
  } finally {
    if (rootNavigator.mounted && rootNavigator.canPop()) {
      rootNavigator.pop();
    }
  }
}
