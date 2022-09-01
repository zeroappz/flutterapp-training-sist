import 'package:flutterapp/values/app_lib.dart';
import 'package:staggered_grid_view_flutter/staggered_grid_view_flutter.dart';

class StaggeredGridViewScreen extends StatefulWidget {
  const StaggeredGridViewScreen({Key? key}) : super(key: key);

  @override
  State<StaggeredGridViewScreen> createState() =>
      _StaggeredGridViewScreenState();
}

class _StaggeredGridViewScreenState extends State<StaggeredGridViewScreen> {
  // Load global Widget
  final _globalWidget = GlobalWidget();
  final rnd = Random();

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
      backgroundColor: Colors.white,
      appBar: _globalWidget.dynamicAppBar('Staggered Grid View'),
      // body: WaterfallFlow.builder(
      //   primary: false,

      // ),
    );
  }
}
