import '../../values/app_lib.dart';

class TabSplashScreen extends StatefulWidget {
  const TabSplashScreen({Key? key}) : super(key: key);

  @override
  State<TabSplashScreen> createState() => _TabSplashScreenState();
}

class _TabSplashScreenState extends State<TabSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
            image: const AssetImage('assets/images/trans.png'),

            // step 1: create assets folder
            // step 2: create logo.png in assets folder
            // step 3: add image to splash_screen.dart
            // step 4: update the assets folder access pubspec.yaml

            // image: NetworkImage("https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png"),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.33,
          ),
          const SizedBox(
            height: 20.0,
          ), // create empty spaces
          const Text(
            "AlgoxFusion App",
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            "Splash Screen",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.normal,
              color: Colors.pinkAccent,
            ),
          ),
        ]),
      );
    });
  }
}
