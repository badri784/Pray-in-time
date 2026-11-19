import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';

import '../../../../core/localization/l10n_extension.dart';
import '../../../../core/localization/locale_cubit.dart';
import '../../../widget/app_loading_dialog.dart';
import 'ambr_container.dart';

class LanguageSection extends StatelessWidget {
  const LanguageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.languageSection,
          style: context.adaptiveFont(
            color: Colors.white.withValues(alpha: 0.4),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Gap(8),
        Material(
          color: const Color(0xff121829),
          borderRadius: BorderRadius.circular(12.r),
          clipBehavior: Clip.antiAlias,
          child: BlocBuilder<LocaleCubit, Locale>(
            builder: (context, locale) {
              final bool isArabic = locale.languageCode == 'ar';
              return SwitchListTile(
                secondary: const AmberContainer(icon: Icons.language_rounded),
                activeThumbColor: Theme.of(context).colorScheme.secondary,
                title: Text(
                  l10n.languageTileTitle,
                  style: context.adaptiveFont(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                subtitle: Text(
                  l10n.languageTileSubtitle,
                  style: context.adaptiveFont(
                    color: Colors.white.withValues(alpha: 0.4),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                value: isArabic,
                onChanged: (bool switchToArabic) async {
                  final localeCubit = context.read<LocaleCubit>();
                  await runWithLoadingDialog<void>(
                    context: context,
                    message: l10n.changingLanguage,
                    action: () async {
                      await Future.wait<void>([
                        localeCubit.changeLocale(
                          Locale(switchToArabic ? 'ar' : 'en'),
                        ),
                        Future<void>.delayed(const Duration(milliseconds: 500)),
                      ]);
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
