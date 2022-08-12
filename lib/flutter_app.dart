// import 'package:flutter/material.dart';
// import '../view/tab_screens/courses_screen.dart';
// import '../view/tab_screens/home_screen.dart';
// import '../view/tab_screens/my_profile_screen.dart';
// import '../view/tab_screens/settings_screen.dart';
// import '../view/tab_screens/splash_screen.dart';
// import '../widgets/side_menu_widget.dart';

import '../../values/app_lib.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 10; // integer variable

  int _page = 0; // integer variable,

  void _incrementCounter() {
    // function definition : void functionName(){}
    // setState((){}) is a function that triggers a re-render of the widget
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    List _currentScreen = [
      const HomeScreen(), // 0th index of _currentScreen
      const CoursesScreen(), // 1st index of _currentScreen
      const MyProfileScreen(), // 2nd index of _currentScreen
      const SettingsScreen(), // 3rd index of _currentScreen
      const TabSplashScreen(), // 4th index of _currentScreen
    ];

    return Scaffold(
      // Scaffold is a widget that provides a default app bar and drawer.
      // appBar
      // body
      // floatingActionButton
      // drawer
      // bottomNavigationBar

      // Ternary Operator
      // condition ? value_if_true : value_if_false
      appBar: _page != 2
          ? AppBar(
              title: Text(widget.title),
              // title: Text("Flutter App Text"),
              backgroundColor: Colors.pinkAccent,
              // leading: IconButton(
              //   icon: Icon(Icons.menu),
              //   onPressed: () {
              //     debugPrint("Menu Icon pressed");
              //   },
              // ),
              actions: [
                // action: [] is a list of widgets
                IconButton(icon: Icon(Icons.add), onPressed: _incrementCounter),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      if (_counter > 0) {
                        _counter--;
                      } else {
                        _counter = 0;
                        debugPrint(
                            "Counter is at 0, no more decrement is happening");
                      }
                    });
                    debugPrint("Decrement with Delete Button pressed");
                  },
                ),
              ],
            )
          : null,
      drawer: const SideMenu(),
      body:
          _currentScreen[_page], // list[0], list[1], list[2], list[3], list[4]

      // Center(
      //   child: Column(
      // Column is a widget that displays its children in a vertical or horizontal arrangement.
      // child - single child widget
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      // <T> - type of the child widget : <Widget>
      //       const Text(
      //         'Static data in text format..',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
      //       ),
      //     ],
      //   ),
      // ),
      floatingActionButton: _page == 0
          ? FloatingActionButton(
              // onPressed: _incrementCounter,
              onPressed: () {
                setState(() {
                  _counter++;
                });
                debugPrint("Floating Action Button pressed");
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            )
          : null, // This leading comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomNavigationBar(

          // BottomNavigationBar is a widget that displays a list of items as
          // a horizontal bar. The items are usually widgets that react to being
          // tapped.
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.pinkAccent),
            BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Courses',
                backgroundColor: Colors.pinkAccent),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                backgroundColor: Colors.pinkAccent),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
                backgroundColor: Colors.pinkAccent),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                label: 'Splash',
                backgroundColor: Colors.pinkAccent),
          ],
          currentIndex: 0,
          selectedItemColor: Colors.white,
          onTap: (int index) => {
                // print("Tapped on $index")
                debugPrint("Tapped on $index"),
                setState(
                  () => {_page = index},
                )
              }),
    );
  }
}



/// items: [0, 1, 2, 3, 4] is a list of widgets from bottomNavigationBar
/// _currentScreen = [0, 1, 2, 3, 4] is a list of widgets from body