import '../../values/app_lib.dart';
import 'staggered_grid.dart';
import 'waterfall_grid.dart';

class GridViewScreenList extends StatefulWidget {
  const GridViewScreenList({Key? key}) : super(key: key);

  @override
  State<GridViewScreenList> createState() => _GridViewScreenListState();
}

class _GridViewScreenListState extends State<GridViewScreenList> {
  // Load global Widget
  final _globalWidget = GlobalWidget();

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
      appBar: _globalWidget.dynamicAppBar("Dynamic Screen"),
      backgroundColor: Colors.white, // _globalWidget._getColor()
      body: ListView(
        padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
        children: [
          _globalWidget.screenTabList(
            context,
            1,
            "Staggered Grid View",
            Icons.ac_unit,
            "StaggeredGridView Screen set up for screen",
            StaggeredGridViewScreen(),
          ),
          _globalWidget.screenTabList(
            context,
            2,
            "WaterFall Grid View",
            Icons.home,
            "WaterFallGridView Screen set up for screen",
            WaterFallGridViewScreen(),
          ),
        ],
      ),
    );
  }
}
