import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class NativeAdhanService {
  NativeAdhanService._();

  static const MethodChannel _channel = MethodChannel(
    'com.example.pray_in_time/adhan_alarm',
  );

  static Future<void> scheduleAdhan({
    required int id,
    required String prayerName,
    required DateTime scheduledTime,
  }) async {
    if (defaultTargetPlatform != TargetPlatform.android) return;
    await _channel.invokeMethod<bool>('scheduleAdhan', <String, dynamic>{
      'id': id,
      'prayerName': prayerName,
      'epochMillis': scheduledTime.millisecondsSinceEpoch,
    });
  }

  static Future<void> cancelAdhan(int id) async {
    if (defaultTargetPlatform != TargetPlatform.android) return;
    await _channel.invokeMethod<bool>('cancelAdhan', <String, dynamic>{
      'id': id,
    });
  }

  static Future<void> stopAdhan() async {
    if (defaultTargetPlatform != TargetPlatform.android) return;
    await _channel.invokeMethod<bool>('stopAdhan');
  }

  static Future<void> playAdhanNow({String prayerName = 'الصلاة'}) async {
    if (defaultTargetPlatform != TargetPlatform.android) return;
    await _channel.invokeMethod<bool>('playAdhanNow', <String, dynamic>{
      'prayerName': prayerName,
    });
  }
}

