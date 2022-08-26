import '../../values/app_lib.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            bottom: false,
            child: Column(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 56,
                        width: 230.0,
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/image1.png"),
                            ),
                            const Expanded(child: SizedBox()),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Column(
                              children: const [
                                Text(
                                  "Praveen Kumar",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "My Bio, I am not new to this",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ));
    });
  }
}

//   Image(
//     image: const AssetImage('assets/images/trans.png'),

//     // step 1: create assets folder
//     // step 2: create logo.png in assets folder
//     // step 3: add image to splash_screen.dart
//     // step 4: update the assets folder access pubspec.yaml

//     // image: NetworkImage("https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png"),
//     width: MediaQuery.of(context).size.width,
//     height: MediaQuery.of(context).size.height * 0.33,
//   ),
//   const SizedBox(
//     height: 20.0,
//   ), // create empty spaces
//   const Text(
//     "AlgoxFusion App",
//     style: TextStyle(
//       fontSize: 30.0,
//       fontWeight: FontWeight.bold,
//       color: Colors.pink,
//     ),
//   ),
//   const SizedBox(
//     height: 20.0,
//   ),
//   const Text(
//     "My Profile Screen",
//     style: TextStyle(
//       fontSize: 24.0,
//       fontWeight: FontWeight.normal,
//       color: Colors.pinkAccent,
//     ),
//   ),
