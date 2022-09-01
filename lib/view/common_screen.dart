import 'package:flutterapp/values/app_lib.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DynamicScreen extends StatefulWidget {
  const DynamicScreen({Key? key}) : super(key: key);

  @override
  State<DynamicScreen> createState() => _DynamicScreenState();
}

class _DynamicScreenState extends State<DynamicScreen> {
  // Load global Widget
  final _globalWidget = GlobalWidget();

  // initState
  @override
  void initState() {
    super.initState();
  }

  // dispose State
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _globalWidget.dynamicAppBar("Dynamic Screen"),
      backgroundColor: Colors.white, // _globalWidget._getColor()
      body: ListView(
        padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
        children: [
          _globalWidget.screenTabList(
            context,
            1,
            "Splash Screen",
            Icons.ac_unit,
            "Splash Screen set up for screen",
            SplashScreen(),
          ),
          _globalWidget.screenTabList(
            context,
            2,
            "Home Screen",
            Icons.home,
            "Home Screen set up for screen",
            const MyHomePage(title: "Home Screen"),
          ),
          _globalWidget.screenTabList(
            context,
            3,
            "Onboarding Screen",
            Icons.home,
            "OnBoardingScreen Screen set up for screen",
            const OnBoardingScreen(),
          ),
          ElevatedButton(
            onPressed: () {
              Fluttertoast.showToast(
                  msg: "Toast Message", toastLength: Toast.LENGTH_LONG);
            },
            child: Text("Toast Message"),
          ),
        ],
      ),
    );
  }
}
