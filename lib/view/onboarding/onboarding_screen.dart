import '../../values/app_lib.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  /// Creating PageController to control the page position
  // final PageController _pageController = PageController(initialPage: 0);
  final _controller = PageController();
  List screenColors = const [
    Color(0xFF9C27B0), // purple
    Color(0xFF673AB7), // deep purple
    Color(0xFF00BCD4), // cyan
  ];
  int _currentPage = 0;

  // AnimatedContainer is used to create a container that animates its height and width
  AnimatedContainer _buildDots({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 700),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: _currentPage == index ? 10 : 6,
      width: _currentPage == index ? 20 : 10,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.white : Colors.grey,
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('OnBoarding Screen'),
      // ),
      // Handle the safe area for the notch on iPhone X
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Image.asset(
                            ImagesPath.onBoardingImage[index],
                            height: MediaQuery.of(context).size.height * 0.45,
                            width: MediaQuery.of(context).size.width,
                          ),
                          const SizedBox(
                            height: 36.0,
                          ),
                          Text(
                            StringConstants.onBoardingTitle[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: Sizes.extraLargeFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            StringConstants.onBoardingDescription[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: Sizes.mediumFontSize,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ), // Expanded to fill the screen
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => _buildDots(index: index),
                    ),
                  ),
                  (_currentPage + 1 == 3)
                      ? Padding(
                          padding: EdgeInsets.all(20),
                          child: ElevatedButton(
                            onPressed: () {
                              Fluttertoast.showToast(
                                msg:
                                    "You have successfully completed onboarding",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black54,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );

                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        // MyHomePage(title: 'Algofusion App'),
                                        const LoginScreen(),
                                  ),
                                  (route) => false);
                            },
                            child: Text('Get Started'),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  _controller.previousPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeIn,
                                  );
                                },
                                child: Text('Previous'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _controller.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeIn,
                                  );
                                },
                                child: Text('Next'),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  elevation: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
