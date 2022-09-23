import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutterapp/view/notifications.dart';
import '../services/notify_service.dart';
import 'package:firebase_core/firebase_core.dart';

import '../values/app_lib.dart';

// Android Material Design Components
// import 'package:flutter/cupertino.dart';
// iOS Cupertino Components

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notification',
  importance: Importance.high,
  playSound: true,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

//We are gonna capture the remote notification even if it from background
Future<dynamic> _firebaseMessagingBackgroundHandler(
    RemoteMessage message) async {
  // Initialize Firebase
  await Firebase.initializeApp();
  debugPrint("******************");
  debugPrint(" Background message has been captured : ${message.messageId}");
  debugPrint(" Background message has been captured : ${message.data}");
  debugPrint("******************");
}

Future<void> main() async {
  //asynchronous
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize Firebase
    await Firebase.initializeApp();

    // Initialize the local notification service using Factory method-Singleton class
    LocalNotificationService().init();

    // Initiate Firebase Remote Messaging
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    debugPrint("error check");

    // to push it local notification
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    debugPrint("error check1");
    // Load instances of FirebaseMessaging
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    debugPrint("error check2");

    //App screen orientation : landscape or portrait
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
      (value) => runApp(
        FlutterApp(), // instantiate the app
      ),
    );
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
    debugPrint(
      "********* " + error.toString(),
    );
  });
}

class FlutterApp extends StatelessWidget {
  FlutterApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConstants.appName,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      // home: const MyHomePage(title: 'Flutter App'),
      home: PushNotifications(),
    );
  }
}
