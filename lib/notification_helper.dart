import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationHelper {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static bool _isInitialized = false;

  static const AndroidNotificationDetails _adhanAndroidDetails =
      AndroidNotificationDetails(
        'adhan_alarm_channel_v2',
        'إشعارات الأذان',
        channelDescription: 'قناة الأذان والتنبيهات لأوقات الصلاة',
        importance: Importance.max,
        priority: Priority.max,
        playSound: true,
        sound: RawResourceAndroidNotificationSound('alarm'),
        audioAttributesUsage: AudioAttributesUsage.alarm,
        category: AndroidNotificationCategory.alarm,
        fullScreenIntent: false,
        visibility: NotificationVisibility.public,
        enableVibration: true,
        icon: '@drawable/ic_app_notification',
        color: Color(0xFFFFAB00),
        autoCancel: true,
      );

  static const NotificationDetails _adhanNotificationDetails =
      NotificationDetails(android: _adhanAndroidDetails);

  static Future<void> init() async {
    if (_isInitialized) return;
    tz.initializeTimeZones();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(
      settings: initializationSettings,
    );
    _isInitialized = true;
  }

  static Future<void> requestPermission() async {
    final AndroidFlutterLocalNotificationsPlugin? androidPlugin =
        flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();
    if (androidPlugin != null) {
      await androidPlugin.requestNotificationsPermission();
    }
  }

  static Future<void> scheduleAdhanNotification({
    required int id,
    required String prayerName,
    required DateTime scheduledTime,
  }) async {
    await init();
    await flutterLocalNotificationsPlugin.cancel(id: id);

    final tz.TZDateTime tzScheduledDate = tz.TZDateTime.from(
      scheduledTime,
      tz.UTC,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id: id,
      title: 'حان وقت صلاة $prayerName',
      body: 'حيّ على الصلاة 🕌',
      scheduledDate: tzScheduledDate,
      notificationDetails: _adhanNotificationDetails,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
    );
  }

  static Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id: id);
  }

  static Future<void> showAlarmNotification({
    String prayerName = 'الصلاة',
  }) async {
    await init();
    await flutterLocalNotificationsPlugin.show(
      id: 0,
      title: 'حان وقت صلاة $prayerName',
      body: 'حيّ على الصلاة 🕌',
      notificationDetails: _adhanNotificationDetails,
    );
  }
}
