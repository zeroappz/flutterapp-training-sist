import '../services/notify_service.dart';

import '../values/app_lib.dart';

// Android Material Design Components
// import 'package:flutter/cupertino.dart';
// iOS Cupertino Components

AndroidNotificationChannel channel;
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> main() async {
  //asynchronous
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize Firebase
    await Firebase.initializeApp();

    // Initialize the local notification service
    LocalNotificationService.init();

    //App screen orientation : landscape or portrait
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
      (value) => runApp(
        FlutterApp(), // instantiate the app
      ),
    );
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
    debugPrint("*********" + error.toString());
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
      home: SplashScreen(),
    );
  }
}
