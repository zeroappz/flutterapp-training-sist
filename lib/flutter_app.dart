import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 10; // integer variable

  void _incrementCounter() {
    // function definition : void functionName(){}
    // setState((){}) is a function that triggers a re-render of the widget
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold is a widget that provides a default app bar and drawer.
      // appBar
      // body
      // floatingActionButton
      // drawer
      // bottomNavigationBar
      appBar: AppBar(
        title: Text(widget.title),
        // title: Text("Flutter App Text"),
        backgroundColor: Colors.pinkAccent,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            debugPrint("Menu Icon pressed");
          },
        ),
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
                  debugPrint("Counter is at 0, no more decrement is happening");
                }
              });
              debugPrint("Decrement with Delete Button pressed");
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          // Column is a widget that displays its children in a vertical or horizontal arrangement.
          // child - single child widget
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // <T> - type of the child widget : <Widget>
            const Text(
              'Static data in text format..',
            ),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _incrementCounter,
        onPressed: () {
          setState(() {
            _counter++;
          });
          debugPrint("Floating Action Button pressed");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
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
          ],
          currentIndex: 0,
          selectedItemColor: Colors.white,
          onTap: (int index) => {
                // print("Tapped on $index")
                debugPrint("Tapped on $index"),
                setState(
                  () => {
                    _counter = index
                  },
                )
              }),
    );
  }
}

// Stateless Widget
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({ Key? key }) : super(key: key);

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
//   // dynamic interpolation
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }