import '../../values/app_lib.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedType = "Pop";
  String selectedDirector = "Ilayaraja";

  onChangeType(String type) {
    debugPrint("*****************");
    debugPrint("Selected Type: $selectedType");
    debugPrint("*****************");
    debugPrint("Passed Type: $type");
    debugPrint("*****************");
    selectedType = type;
    debugPrint("Selected Type: $selectedType");
    debugPrint("*****************");
    setState(() {});
  }

  changeDirectors(String directorName) {
    debugPrint("*****************");
    debugPrint("Selected Director: $selectedDirector");
    debugPrint("*****************");
    debugPrint("Passed Director: $directorName");
    debugPrint("*****************");
    selectedDirector = directorName;
    debugPrint("Selected Director: $selectedDirector");
    debugPrint("*****************");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.pinkAccent,
      //   title: const Text(
      //     "Select your preferences",
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontWeight: FontWeight.w700,
      //     ),
      //   ),
      // ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(120.0),
            topRight: Radius.circular(120.0),
            // bottomLeft: Radius.circular(40.0),
          ),
        ),
        child: ListView(
          children: [
            const Text(
              "Choose Your Preferences",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    // print("pressed");
                    debugPrint("Pressed once");
                    onChangeType("Jazz");
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 140.0,
                        width: MediaQuery.of(context).size.width * 0.40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/image1.png"),
                          ),
                          color: Colors.deepPurple[50],
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        "Jazz",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.deepPurple[50],
                        ),
                        child: selectedType == "Jazz"
                            ? Icon(
                                Icons.check_circle,
                                size: 30.0,
                                color: Colors.pinkAccent,
                              )
                            : Container(),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    // print("pressed");
                    debugPrint("Pressed once");
                    onChangeType("Melody");
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 140.0,
                        width: MediaQuery.of(context).size.width * 0.40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/image2.png"),
                          ),
                          color: Colors.deepPurple[50],
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        "Melody",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.deepPurple[50],
                        ),
                        child: selectedType == "Melody"
                            ? Icon(
                                Icons.check_circle,
                                size: 30.0,
                                color: Colors.pinkAccent,
                              )
                            : Container(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Text(
              "Music Directors you love",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    // print("pressed");
                    debugPrint("Pressed once");
                    changeDirectors("Rahman");
                  },
                  child: Container(
                    height: 56,
                    width: 100,
                    decoration: selectedDirector == "Rahman"
                        ? BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.pink[400],
                          )
                        : BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.black.withOpacity(0.3),
                          ),
                    child: Center(
                      child: Text(
                        "Rahman",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: selectedDirector == "Rahman"
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // print("pressed");
                    debugPrint("Pressed once");
                    changeDirectors("Ilayaraja");
                  },
                  child: Container(
                    height: 56,
                    width: 100,
                    decoration: selectedDirector == "Ilayaraja"
                        ? BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.pink[400],
                          )
                        : BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.black.withOpacity(0.3),
                          ),
                    child: Center(
                      child: Text(
                        "Ilayaraja",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: selectedDirector == "Ilayaraja"
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // print("pressed");
                    debugPrint("Pressed once");
                    changeDirectors("Anirudh");
                  },
                  child: Container(
                    height: 56,
                    width: 100,
                    decoration: selectedDirector == "Anirudh"
                        ? BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.pink[400],
                          )
                        : BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.black.withOpacity(0.3),
                          ),
                    child: Center(
                      child: Text(
                        "Anirudh",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: selectedDirector == "Anirudh"
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Text(
              "Movies you would love",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                dynamicWidget("Bahubali"),
                dynamicWidget("Robot"),
                dynamicWidget('King Kong'),
                dynamicWidget("Vikram"),
                dynamicWidget("Anjaan"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Column dynamicWidget(String name) {
    return Column(children: [
      Stack(
        children: [
          Container(
            height: 70.0,
            width: 70.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.pinkAccent,
            ),
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/image2.png"),
                    fit: BoxFit.contain),
              ),
            ),
          ),
          // const SizedBox(height: 20.0),
          // Text(
          //   name,
          //   style: TextStyle(
          //     fontSize: 16.0,
          //     fontWeight: FontWeight.w500,
          //   ),
          // ),
        ],
      )
    ]);
  }
}
