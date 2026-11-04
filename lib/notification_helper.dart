import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationHelper {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static bool _isInitialized = false;

  static NotificationDetails _buildNotificationDetails(bool isArabic) {
    final AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'adhan_alarm_channel_v2',
          isArabic ? 'إشعارات الأذان' : 'Adhan Notifications',
          channelDescription: isArabic
              ? 'قناة الأذان والتنبيهات لأوقات الصلاة'
              : 'Adhan and prayer time alerts channel',
          importance: Importance.max,
          priority: Priority.max,
          playSound: true,
          sound: const RawResourceAndroidNotificationSound('alarm'),
          audioAttributesUsage: AudioAttributesUsage.alarm,
          category: AndroidNotificationCategory.alarm,
          fullScreenIntent: false,
          visibility: NotificationVisibility.public,
          enableVibration: true,
          icon: '@drawable/ic_app_notification',
          color: const Color(0xFFFFAB00),
          autoCancel: true,
        );
    return NotificationDetails(android: androidDetails);
  }

  static Future<bool> _isArabicSelected() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return (prefs.getString('app_locale') ?? 'en') == 'ar';
  }

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
    final bool isArabic = await _isArabicSelected();

    final tz.TZDateTime tzScheduledDate = tz.TZDateTime.from(
      scheduledTime,
      tz.UTC,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id: id,
      title: isArabic
          ? 'حان وقت صلاة $prayerName'
          : "It's time for $prayerName prayer",
      body: isArabic ? 'حيّ على الصلاة 🕌' : 'Come to Prayer 🕌',
      scheduledDate: tzScheduledDate,
      notificationDetails: _buildNotificationDetails(isArabic),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
    );
  }

  static Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id: id);
  }

  static Future<void> showAlarmNotification({
    String? prayerName,
  }) async {
    await init();
    final bool isArabic = await _isArabicSelected();
    final String resolvedPrayer =
        prayerName ?? (isArabic ? 'الصلاة' : 'Prayer');

    await flutterLocalNotificationsPlugin.show(
      id: 0,
      title: isArabic
          ? 'حان وقت صلاة $resolvedPrayer'
          : "It's time for $resolvedPrayer prayer",
      body: isArabic ? 'حيّ على الصلاة 🕌' : 'Come to Prayer 🕌',
      notificationDetails: _buildNotificationDetails(isArabic),
    );
  }
}
