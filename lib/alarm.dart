import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

// لازم الدالة تكون بره أي كلاس (Top-Level Function)
@pragma('vm:entry-point')
void myAlarmFunction() {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint("🔔 المنبه اشتغل في الخلفية بنجاح!");
  FlutterRingtonePlayer().play(
    fromAsset: "assets/sound/alarm.mp3",
    looping: true,
    volume: 0.1,
    asAlarm: true, // مهم عشان يشتغل حتى لو الموبايل على الصامت
  );
}
