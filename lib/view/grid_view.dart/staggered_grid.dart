import '../../values/app_lib.dart';

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

  // Loading Network Images
  final _images = ImagesPath.imgList;
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
      // itemBuilder is used to create list of objects according to its length
      body: MasonryGridView.count(
        crossAxisCount: 2, // rows
        itemCount: _images.length, // count of the items - 8
        mainAxisSpacing: 10,
        crossAxisSpacing: 5,
        itemBuilder: (context, index) {
          var _height = rnd.nextInt(180) + 100;
          return InkWell(
            onTap: () {
              Fluttertoast.showToast(msg: _images[index]);
            },
            child: Card(
              shadowColor: Colors.grey.withOpacity(0.8),
              elevation: rnd.nextInt(10).toDouble(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Image(
                  // image: AssetImage("assets/images/image1.png"),
                  image: NetworkImage(_images[index]),
                  height: _height.toDouble(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
