import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'setting_widgets/alarm_and_notification_section.dart';
import 'setting_widgets/appbar_setting.dart';
import 'setting_widgets/language_section.dart';
import 'setting_widgets/location_section.dart';
import 'setting_widgets/support_and_info_section.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarSettings(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 8, left: 24, right: 24, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AlarmAndNofiticationSection(),
              Gap(8),
              LocationSection(),
              Gap(8),
              LanguageSection(),
              Gap(8),
              SupportAndInfoSection(),
            ],
          ),
        ),
      ),
    );
  }
}
