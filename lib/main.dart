// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:flutter/services.dart';

import '../values/app_lib.dart';

// Android Material Design Components
// import 'package:flutter/cupertino.dart';
// iOS Cupertino Components

Future<void> main() async {
  //asynchronous
  await runZonedGuarded(() async {
    // WidgetsFlutterBinding.ensureInitialized();

    // Initialize Firebase
    // await Firebase.initializeApp();

    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    // (value) =>
    runApp(
      FlutterApp(), // instantiate the app
    );
    // );
  }, (error, stackTrace) {
    // FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

class FlutterApp extends StatelessWidget {
  const FlutterApp({Key? key}) : super(key: key);

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
