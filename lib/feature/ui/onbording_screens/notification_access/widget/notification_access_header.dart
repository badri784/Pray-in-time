import 'package:flutter/material.dart';

import '../../../../../core/utils/responsive_helper.dart';

class NotificationAccessHeader extends StatelessWidget {
  const NotificationAccessHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 24),
      child: Row(
        children: [
          Icon(
            Icons.mosque,
            size: 22.clampSp(),
            color: const Color(0xffc58505),
          ),
          const SizedBox(width: 10),
          const Text(
            'Prayer in time',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

