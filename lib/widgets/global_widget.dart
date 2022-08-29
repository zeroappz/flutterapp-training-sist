import 'package:flutterapp/values/app_lib.dart';

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
}
