import '../../values/app_lib.dart';

class WaterFallGridViewScreen extends StatefulWidget {
  const WaterFallGridViewScreen({Key? key}) : super(key: key);

  @override
  State<WaterFallGridViewScreen> createState() =>
      _WaterFallGridViewScreenState();
}

class _WaterFallGridViewScreenState extends State<WaterFallGridViewScreen> {
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
        appBar: _globalWidget.dynamicAppBar('Sliver Grid View'),
        // itemBuilder is used to create list of objects according to its length
        body: CustomScrollView(
          slivers: [
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: _images.length,
                ((context, index) {
                  return InkWell(
                    onTap: () {
                      Fluttertoast.showToast(msg: _images[index]);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: Image(
                        image: NetworkImage(_images[index]),
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8,
                crossAxisSpacing: 5,
                crossAxisCount: 4,
              ),
            ),
          ],
        )
        // crossAxisCount: 2, // rows
        // itemCount: _images.length, // count of the items - 8
        // mainAxisSpacing: 10,
        // crossAxisSpacing: 5,
        // itemBuilder: (context, index) {
        //   var _height = rnd.nextInt(180) + 100;
        //   return Card(
        //     shadowColor: Colors.grey.withOpacity(0.8),
        //     elevation: rnd.nextInt(10).toDouble(),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(16.0),
        //     ),
        //     child: Padding(
        //       padding: EdgeInsets.all(6.0),
        //       child: Image(
        //         // image: AssetImage("assets/images/image1.png"),
        //         image: NetworkImage(_images[index]),
        //         height: _height.toDouble(),
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //   );
        // },

        );
  }
}
