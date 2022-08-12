// import 'package:flutter/material.dart';
// import '../flutter_app.dart';

/// Instead of importing all the routes, we can create our own library and import it.
// import '../values/colors.dart';
// import '../values/dimensions.dart';
// import '../values/images.dart';
// import '../values/strings.dart';

/// Our Own Library
// import '../values/values.dart';

import '../../values/app_lib.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const MyHomePage(title: StringConstants.appName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
            image: const AssetImage(ImagesPath.transparentLogo),

            // step 1: create assets folder
            // step 2: create logo.png in assets folder
            // step 3: add image to splash_screen.dart
            // step 4: update the assets folder access pubspec.yaml

            // image: NetworkImage("https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png"),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.33,
          ),
          const SizedBox(
            height: Sizes.medium,
          ), // create empty spaces
          const Text(
            StringConstants.appName,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          ),
          const SizedBox(
            height: Sizes.medium,
          ),
          const Text(
            StringConstants.appDesc,
            style: TextStyle(
              fontSize: Sizes.largeFontSize,
              fontWeight: FontWeight.normal,
              color: AppColors.primaryColor,
            ),
          ),
        ]),
      );
    });
  }
}
