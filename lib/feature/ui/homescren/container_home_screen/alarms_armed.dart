import 'package:flutter/material.dart';

import '../../../../core/localization/l10n_extension.dart';

class AlarmsArmed extends StatelessWidget {
  const AlarmsArmed({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '${l10n.appTitle} ',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
            TextSpan(text: l10n.alarmsArmed),
          ],
        ),
      ),
    );
  }
}
