import 'package:flutter/material.dart';
import 'package:hijri_date/hijri.dart';

import '../../../../core/localization/l10n_extension.dart';
import '../../../../core/utils/responsive_helper.dart';

class HijriDateWidget extends StatelessWidget {
  const HijriDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HijriDate.setLocal(context.localeCode);
    final todayHijri = HijriDate.now();

    return Text(
      todayHijri.fullDate(),
      style: context.adaptiveFont(
        fontSize: 14.clampSp(),
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
