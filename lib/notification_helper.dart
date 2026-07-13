import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  
  static Future<void> init() async {
    
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(
      settings: initializationSettings,
    );
  }

  
  static Future<void> requestPermission() async {
    final androidPlugin = flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    if (androidPlugin != null) {
      await androidPlugin.requestNotificationsPermission();
    }
  }

  
  static Future<void> showAlarmNotification({String prayerName = 'الصلاة'}) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          'alarm_channel_id', 
          'إشعارات الصلاة', 
          channelDescription: 'قناة التنبيهات لأوقات الصلاة',
          importance: Importance.max, 
          priority: Priority.max, 
          fullScreenIntent: true, 
          visibility: NotificationVisibility
              .public, 
          playSound:
              false, 
          enableVibration: true,
        );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.show(
      id: 0, 
      title: 'حان وقت صلاة $prayerName',
      body: 'حيّ على الصلاة 🕌',
      notificationDetails: platformChannelSpecifics,
    );
  }
}
