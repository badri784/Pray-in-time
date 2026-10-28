import 'package:flutter/material.dart';

import '../notification_access/widget/allow_notification_button.dart';
import '../notification_access/widget/notification_access_header.dart';
import 'widget/location_access_background.dart';
import 'widget/location_access_texts.dart';
import 'widget/location_ambient_backlight.dart';
import 'widget/location_bottom_watermark.dart';
import 'widget/location_top_watermark.dart';

class LoactionAccess extends StatelessWidget {
  const LoactionAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090b15),
      body: SafeArea(
        child: Stack(
          children: [
            const NotificationAccessHeader(),
            const LocationTopWatermark(),
            const LocationAmbientBacklight(),
            const LocationAccessBackground(),
            const LocationBottomWatermark(),
            Positioned(
              left: 0,
              right: 0,
              bottom: 180,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const LocationAccessTexts(),
                    const SizedBox(height: 8),
                    AllowButtonWidget(
                      text: 'Enaple Location Access',
                      onpressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
