import 'package:flutter/material.dart';

import '../../../../core/Route/route.dart';
import '../../../../core/helper/extensionss.dart';
import '../../../../notification_helper.dart';
import 'widget/allow_notification_button.dart';
import 'widget/notification_access_background.dart';
import 'widget/notification_access_header.dart';
import 'widget/notification_access_texts.dart';

class NotificationAccess extends StatelessWidget {
  const NotificationAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   title: const Text('Prayer in time'),
      //   leading: const Icon(Icons.mosque, size: 18, color: Color(0xffc58505)),
      // ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x0b0c15ff), Color(0xff131215)],
              begin: AlignmentGeometry.centerRight,
              end: AlignmentGeometry.centerLeft,
            ),
          ),
          child: Stack(
            children: [
              const NotificationAccessHeader(),
              const NotificationAccessBackground(),
              Positioned(
                bottom: 100,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const NotificationAccessTexts(),
                      const SizedBox(height: 15),
                      AllowButtonWidget(
                        text: 'Allow notifications',
                        onpressed: () async {
                          await NotificationHelper.init();
                          await NotificationHelper.requestPermission();
                          if (!context.mounted) {
                            return;
                          }
                          context.pushReplacementName(AppRoutes.locationAccess);
                        },
                      ),
                    ],
                  ),
                ),
              ),

              // Image.asset('assets/image/forground_image.png'),
            ],
          ),
        ),
      ),
    );
  }
}
