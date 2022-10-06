import 'dart:convert';

import '../values/app_lib.dart';
import 'package:http/http.dart' as http;

class APIServices {
  final googleAPIKey = 'AIzaSyDZtKkP8dsaBrD-ZVfgf0vyNKkRmtHJGwQ';
  final baseURL = '';
  final googleApiURL =
      'https://maps.googleapis.com/maps/api/distancematrix/json?';

  Future<Map<String, dynamic>> getDistanceMatrixAPI(
      String origin, String destination) async {
    debugPrint(origin);
    debugPrint(destination);

    var finalUrl = googleApiURL +
        "origins=$origin" +
        "&destinations=$destination" +
        "&key=$googleAPIKey";
    // https://maps.googleapis.com/maps/api/distancematrix/json?origins=Salem, Taminadu, India&destinations=Chennai, Tamilnadu, India&key=AIzaSyDZtKkP8dsaBrD-ZVfgf0vyNKkRmtHJGwQ
    debugPrint(finalUrl);
    final response = await http.get(Uri.parse(finalUrl));
    debugPrint("----------------------");
    debugPrint(response.toString());
    debugPrint("----------------------");
    debugPrint(response.bodyBytes.toString());
    debugPrint("----------------------");

    // response will be in the form of JSON - convert the JSON to MAP object
    Map<String, dynamic> responseMap = json.decode(
      utf8.decode(
        response.bodyBytes,
      ),
    );

    return responseMap;
  }
}
