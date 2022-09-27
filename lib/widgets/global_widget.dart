import 'package:flutterapp/values/app_lib.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GlobalWidget {
  // Dynamic Global AppBar Widget
  AppBar dynamicAppBar(String title) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }

  Widget createDetailWidget(String title, String desc) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 12.0,
          ),
          child: Text(
            desc,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }

  /// How we can make our icons and lists into a dynamic or random colors
  Random _random = Random();

  // create random color for polylines
  Color _getColor() {
    return Color.fromARGB(
        255, _random.nextInt(255), _random.nextInt(255), _random.nextInt(255));
  }

  /// Icon Data Set as a global List

  final List<IconData> _iconList = [
    Icons.code,
    Icons.star_rate,
    Icons.album,
    Icons.memory,
    Icons.audiotrack,
    Icons.eco,
    Icons.adb,
    Icons.android,
    Icons.ios_share,
    Icons.whatsapp,
    Icons.whatshot
  ];

  // Dynamic Screen List
  Widget screenTabList(BuildContext context, int id, String title,
      IconData icon, String desc, StatefulWidget screen) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Fluttertoast.showToast(
          msg: "Navigating to " + title,
          toastLength: Toast.LENGTH_LONG,
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 16, bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 20,
              child: Text(
                id.toString(),
              ),
            ),
            const SizedBox(width: 24),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              elevation: 2,
              color: Colors.white,
              child: Container(
                width: 48,
                height: 48,
                child: Icon(
                  icon,
                  color: _getColor(),
                ),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4),
                    (desc == null)
                        ? Wrap()
                        : Text(
                            desc,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                    (desc == null) ? Wrap() : const SizedBox(height: 4),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NetworkImagesData {}

class CustomizedButton extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final VoidCallback? onPressed;
  const CustomizedButton(
      {Key? key,
      this.buttonText,
      this.buttonColor,
      this.textColor,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(
                color: buttonColor,
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Text(
              buttonText!,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
              ),
            ))),
      ),
    );
  }
}
