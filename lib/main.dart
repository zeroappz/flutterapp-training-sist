import 'package:flutterapp/view/grid_view.dart/grid_view_list.dart';

import '../values/app_lib.dart';

// Android Material Design Components
// import 'package:flutter/cupertino.dart';
// iOS Cupertino Components

void main() {
  runApp(
    FlutterApp(), // instantiate the app
  );
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
      home: GridViewScreenList(),
    );
  }
}
