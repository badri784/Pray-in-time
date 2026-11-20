import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

import '../../../../core/localization/l10n_extension.dart';
import '../../../../core/logic/prayer_time_cubit.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../widget/app_loading_dialog.dart';
import 'ambr_container.dart';
import 'settings_listtile.dart';

class AlarmAndNofiticationSection extends StatelessWidget {
  const AlarmAndNofiticationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.alarmAndNotificationSection,
          style: context.adaptiveFont(
            color: Colors.white.withValues(alpha: 0.4),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Gap(12.h),
        Material(
          color: const Color(0xff121829),
          borderRadius: BorderRadius.circular(12.r),
          child: Column(
            children: [
              // ListTileSetting(
              //   ontap: () {
              //     showDialog(
              //       context: context,
              //       builder: (dialogContext) => AlertDialog(
              //         title: Text(
              //           l10n.adhanSounds,
              //           style: dialogContext.adaptiveFont(
              //             color: Colors.white,
              //             fontSize: 15.sp,
              //             fontWeight: FontWeight.w600,
              //           ),
              //         ),
              //         content: Text(
              //           l10n.comingSoon,
              //           style: dialogContext.adaptiveFont(
              //             color: Colors.white,
              //             fontSize: 15.sp,
              //             fontWeight: FontWeight.w400,
              //           ),
              //         ),
              //         actions: [
              //           TextButton(
              //             onPressed: () {
              //               Navigator.pop(dialogContext);
              //             },
              //             child: Text(
              //               l10n.okButton,
              //               style: dialogContext.adaptiveFont(
              //                 color: AppColors.primaryEmerald,
              //                 fontWeight: FontWeight.w600,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              //   text: l10n.adhanSounds,
              //   textStyle: context.adaptiveFont(
              //     color: Colors.white,
              //     fontSize: 15.sp,
              //     fontWeight: FontWeight.w400,
              //   ),
              //   subtitle: l10n.defaultOption,
              //   subtitleStyle: context.adaptiveFont(
              //     color: Colors.white.withValues(alpha: 0.4),
              //     fontSize: 12.sp,
              //     fontWeight: FontWeight.w400,
              //   ),
              //   trailing: Icon(
              //     Icons.arrow_drop_down,
              //     color: Theme.of(context).colorScheme.secondary,
              //     size: 24.clampSp(),
              //   ),
              //   leading: const AmberContainer(icon: Icons.notifications),
              // ),
              // const Gap(4),
              // const DriverWidget(),
              // const Gap(4),
              ListTileSetting(
                ontap: () async {
                  final cubit = context.read<PrayerTimeCubit>();
                  await runWithLoadingDialog<void>(
                    context: context,
                    message: l10n.refreshingPrayerTimes,
                    action: () async {
                      await Future.wait<void>([
                        cubit.getPrayerTimes(),
                        Future<void>.delayed(const Duration(milliseconds: 500)),
                      ]);
                    },
                  );
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        l10n.prayerTimesRefreshed,
                        style: context.adaptiveFont(
                          color: Colors.white,
                          fontSize: 13.sp,
                        ),
                      ),
                      backgroundColor: const Color(0xff121829),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        side: BorderSide(
                          color: Theme.of(
                            context,
                          ).colorScheme.secondary.withValues(alpha: 0.3),
                        ),
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                text: l10n.restartPrayerTimeTitle,
                textStyle: context.adaptiveFont(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
                subtitle: l10n.restartPrayerTimeSubtitle,
                subtitleStyle: context.adaptiveFont(
                  color: Colors.white.withValues(alpha: 0.4),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
                trailing: Icon(
                  Icons.restart_alt_sharp,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 24.clampSp(),
                ),
                leading: const AmberContainer(icon: Icons.restart_alt_rounded),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
