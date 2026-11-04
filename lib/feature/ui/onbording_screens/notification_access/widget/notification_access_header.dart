import 'package:flutter/material.dart';

import '../../../../../core/localization/l10n_extension.dart';
import '../../../../../core/utils/responsive_helper.dart';

class NotificationAccessHeader extends StatelessWidget {
  const NotificationAccessHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, top: 24),
      child: Row(
        children: [
          Icon(
            Icons.mosque,
            size: 22.clampSp(),
            color: const Color(0xffc58505),
          ),
          const SizedBox(width: 10),
          Text(
            context.l10n.appTitle,
            style: context.adaptiveFont(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
