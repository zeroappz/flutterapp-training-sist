import 'package:flutterapp/services/notify_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutterapp/values/app_lib.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title// description
    importance: Importance.high,
    playSound: true);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint("******************");
  debugPrint(" Background message has been captured : ${message.messageId}");
  debugPrint(" Background message has been captured : ${message.data}");
  debugPrint("******************");
}

class PushNotifications extends StatefulWidget {
  const PushNotifications({Key? key}) : super(key: key);

  @override
  State<PushNotifications> createState() => _PushNotificationsState();
}

class _PushNotificationsState extends State<PushNotifications> {
  // Load notification services
  final LocalNotificationService _notifyService = LocalNotificationService();

  String token = "";
  @override
  void initState() {
    super.initState();
    getToken();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              color: Colors.blue,
              playSound: true,
              icon: '@mipmap/ic_launcher',
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notification.body!),
                    ],
                  ),
                ),
              );
            });
      }
    });
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        token = token;
        debugPrint("*****************************************");
        debugPrint(token);
        debugPrint("*****************************************");
      });
    });
  }

  void showNotification() {
    flutterLocalNotificationsPlugin.show(
      0,
      "Testing",
      "How you doing?",
      NotificationDetails(
        android: AndroidNotificationDetails(channel.id, channel.name,
            importance: Importance.high,
            color: Colors.blue,
            playSound: true,
            icon: '@mipmap/ic_launcher'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalWidget().dynamicAppBar("Push Notifications"),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await _notifyService.showNotification();
                  },
                  child: Text(
                    'Show Notification',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    await _notifyService.showDynamicNotification(
                        2,
                        "Amazon's Great Indian Festival Offer",
                        "Hurray!, India's best offers are available right now in Amazon");
                  },
                  child: Text(
                    'Dynamic Notification',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    await _notifyService.scheduledNotification(
                        3,
                        "Amazon's Great Indian Festival Offer",
                        "Hurray!, India's best offers are available right now in Amazon");
                  },
                  child: Text(
                    'Scheduled Notifications',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    await _notifyService.cancelNotification(3);
                  },
                  child: Text(
                    'Cancel Notification',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    await _notifyService.cancelAllNotifications();
                  },
                  child: Text(
                    'Cancel All Notifications',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    showNotification();
                  },
                  child: Text(
                    'Firebase Notifications',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
