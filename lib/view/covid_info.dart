import 'package:flutterapp/models/covid_information_model.dart';

import '../services/api_services.dart';
import '../values/app_lib.dart';

class CovidInformationScreen extends StatefulWidget {
  const CovidInformationScreen({Key? key}) : super(key: key);

  @override
  State<CovidInformationScreen> createState() => _CovidInformationScreenState();
}

class _CovidInformationScreenState extends State<CovidInformationScreen> {
  late Map<String, dynamic>
      output; // late object - this will make understand that later the data will be provided for sure
  List<CovidInformationModel> listObj = [];
  // API services are loaded
  Future _covidInfo() async {
    output = await APIServices().covidInformation();
    // debugPrint("*********");
    // debugPrint(output.toString());
    // debugPrint("*********");
    // listObj = output["cases_time_series"];
    // debugPrint(listObj.length.toString());
    return output;
  }

  // initState
  @override
  void initState() {
    super.initState();

    // fetching the data on loading the page
    _covidInfo().then((result) {
      // debugPrint(result["cases_time_series"].toString());
      listObj = result;
      debugPrint(listObj.length.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("*****");
    debugPrint(listObj.length.toString());
    return Scaffold(
      appBar: GlobalWidget().dynamicAppBar("Covid Information"),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: const Icon(Icons.list),
              trailing: const Text(
                "ABC",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              title: Text("List item $index"),
            );
          }),
    );
  }
}
