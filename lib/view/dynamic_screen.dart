import 'package:flutterapp/services/api_services.dart';

import '../values/app_lib.dart';

class DynamicScreen extends StatefulWidget {
  const DynamicScreen({Key? key}) : super(key: key);

  @override
  State<DynamicScreen> createState() => _DynamicScreenState();
}

class _DynamicScreenState extends State<DynamicScreen> {
  // Load global Widget
  final _globalWidget = GlobalWidget();

  late Map<String, dynamic>
      output; // late object - this will make understand that later the data will be provided for sure

  // API services are loaded
  Future<Map<String, dynamic>> _distanceMatrixAPI() async {
    output = await APIServices().getDistanceMatrixAPI(
        'Salem, Tamilnadu, India', 'Chennai, Tamilnadu, India');
    debugPrint("*********");
    debugPrint(output.toString());
    debugPrint("*********");
    return output;
  }

  // initState
  @override
  void initState() {
    super.initState();

    // fetching the data on loading the page
    _distanceMatrixAPI().then((distanceObj) {
      debugPrint(distanceObj.toString());
      debugPrint(distanceObj["destination_addresses"].toString());
      Fluttertoast.showToast(
          msg: distanceObj["destination_addresses"].toString());
    });
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
          SizedBox(
            height: 20.0,
          ),
          Text("Origin: " + output["origin_addresses"].toString()),
          SizedBox(
            height: 20.0,
          ),
          Text("Destination: " + output["destination_addresses"].toString()),
          SizedBox(
            height: 20.0,
          ),
          Text("Distance: " + output["rows"].toString()),
          SizedBox(
            height: 20.0,
          ),
          Text("Distance: " + output["rows"].toString()),
        ],
      ),
    );
  }
}
