import 'package:flutter/material.dart';
// import 'package:flutterapp/view/splash_screen.dart';
import '../view/splash_screen.dart';
// Android Material Design Components
// import 'package:flutter/cupertino.dart';
// iOS Cupertino Components

import 'flutter_app.dart';

void main() {
  runApp(
    FlutterApp() // instantiate the app
  );
}

class FlutterApp extends StatelessWidget {
  const FlutterApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      // home: const MyHomePage(title: 'Flutter App'),
      home: const SplashScreen(),
    );
  }
}
