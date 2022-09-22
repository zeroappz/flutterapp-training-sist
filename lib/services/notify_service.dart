import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
// Class-Inherited wherever it required

class LocalNotificationService {
  //Singleton Object - only one instance can be created

  static LocalNotificationService _notifyService =
      LocalNotificationService._internal();

  // factory
  factory LocalNotificationService() {
    return _notifyService;
  }
  LocalNotificationService._internal();

  // Channel ID, notification title, notification description
  static const channelID = "1";

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  //General Setting object for platforms
  Future<dynamic> init() async {
    //Android Notification Settings
    const AndroidInitializationSettings _initAndroidSetting =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings _initIOSSetting =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: _initAndroidSetting, iOS: _initIOSSetting);

    // load timezones
    tz.initializeTimeZones();

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  final AndroidNotificationDetails _androidNotificationDetails =
      AndroidNotificationDetails('channelID', 'channelName',
          playSound: true, enableVibration: true, importance: Importance.high);

  final DarwinNotificationDetails _iosNotificationDetails =
      DarwinNotificationDetails();

  // Show Notification
  Future<void> showNotification() async {
    await _flutterLocalNotificationsPlugin.show(
      0,
      'Big Billion Day',
      "Hurray!, India's best offers are available right now in Flipkart",
      NotificationDetails(android: _androidNotificationDetails),
    );
  }

  // Show Notification
  Future<void> showDynamicNotification(
      int id, String title, String desc) async {
    await _flutterLocalNotificationsPlugin.show(
      id,
      title,
      desc,
      NotificationDetails(android: _androidNotificationDetails),
    );
  }

  // cancel Notification based on ID
  Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  // cancel all Notifications
  Future<void> cancelAllNotifications() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }

  // Scheduled Notification
  Future<void> scheduledNotification(int id, String title, String desc) async {
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      desc,
      tz.TZDateTime.now(tz.local).add(
        const Duration(seconds: 3),
      ),
      NotificationDetails(android: _androidNotificationDetails),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }
}
