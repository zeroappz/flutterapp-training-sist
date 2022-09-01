import 'package:flutterapp/models/booking_report_model.dart';
import 'package:flutterapp/values/app_lib.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReportingScreen extends StatefulWidget {
  const ReportingScreen({Key? key}) : super(key: key);

  @override
  State<ReportingScreen> createState() => _ReportingScreenState();
}

class _ReportingScreenState extends State<ReportingScreen> {
  // Instantiation for the global Widget
  final _globalWidget = GlobalWidget();

  // Data Series
  late var _series;
  late var _seriesColor;

  // Late variable - Assuring that values will be provided for sure
  final List<SalesReportModel> _data = [
    SalesReportModel("2014", 50),
    SalesReportModel("2015", 80),
    SalesReportModel("2016", 160),
    SalesReportModel("2017", 70),
    SalesReportModel("2018", 150),
    SalesReportModel("2019", 40),
    // SalesReportModel("2020", 240),
  ];

  final List<BookingReportModel> _dataColor = [
    BookingReportModel("Doctor Appointment", 50, Colors.red),
    BookingReportModel("Consultation", 80, Colors.green),
    BookingReportModel("Ortho", 160, Colors.blue),
    BookingReportModel("Pediatrician", 70, Colors.yellow),
    BookingReportModel("Gynecology", 150, Colors.pink),
    BookingReportModel("ENT", 40, Colors.orange),
    // BookingReportModel("2020", 240),
  ];

  // two labels -
  // 2020 : 120
  // 2021 : 146

  // dynamic data load on start of this page
  @override
  void initState() {
    debugPrint("on initializing this screen...");
    super.initState();

    _series = [
      charts.Series(
        id: "Sales",
        domainFn: (SalesReportModel sales, _) => sales.year,
        measureFn: (SalesReportModel sales, _) => sales.salesCount,
        // to analyze the space between pie chart
        labelAccessorFn: (SalesReportModel sales, _) =>
            sales.year + ' - ' + sales.salesCount.toString(),
        // If the text is too long, it will appear outside the pie chart
        data: _data,
      )
    ];

    _seriesColor = [
      charts.Series(
        id: "Sales",
        domainFn: (BookingReportModel booking, _) => booking.year,
        measureFn: (BookingReportModel booking, _) => booking.salesCount,
        colorFn: (BookingReportModel booking, _) => booking.color,
        // to analyze the space between pie chart
        labelAccessorFn: (BookingReportModel booking, _) =>
            booking.year + ' : ' + booking.salesCount.toString(),
        // If the text is too long, it will appear outside the pie chart
        data: _dataColor,
      )
    ];
  }

  // Life Cycle of a page will starts with initState() and ends at dispose()

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: GlobalWidget().dynamicAppBar("Charting Page"),
      appBar: _globalWidget.dynamicAppBar("Charts & Reports"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _globalWidget.createDetailWidget(
                "Sales Report", "Sales report in Pie Chart"),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 8.0,
              ),
              child: SizedBox(
                height: 400.0,
                child: charts.PieChart<String>(
                  _series,
                  animate: true,
                  defaultRenderer: charts.ArcRendererConfig(
                      arcRendererDecorators: [charts.ArcLabelDecorator()]),
                ),
              ),
            ),
            _globalWidget.createDetailWidget(
                "Booking Report", "Booking report in Donut Colors Chart"),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 18.0,
              ),
              child: SizedBox(
                height: 400.0,
                child: charts.PieChart<String>(
                  _seriesColor,
                  animate: true,
                  defaultRenderer: charts.ArcRendererConfig(
                    arcRendererDecorators: [
                      charts.ArcLabelDecorator(),
                    ],
                    arcWidth: 100, // make pie chart as a donut chart),
                  ),
                ),
              ),
            ),
            _globalWidget.createDetailWidget(
                "Trim Booking Report", "Booking report in Pie Colors Chart"),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 18.0,
              ),
              child: SizedBox(
                height: 400.0,
                child: charts.PieChart<String>(
                  _seriesColor,
                  animate: true,
                  defaultRenderer: charts.ArcRendererConfig(
                    arcRendererDecorators: [
                      charts.ArcLabelDecorator(),
                    ],
                    // arcWidth: 100, // make pie chart as a donut chart),
                  ),
                  behaviors: [
                    charts.DatumLegend(
                      horizontalFirst: false,
                      desiredMaxRows: 3,
                      // position: charts.BehaviorPosition.end,
                      showMeasures: true,
                      // Configure the measure value to be shown by default in the legend.
                      legendDefaultMeasure:
                          charts.LegendDefaultMeasure.firstValue,
                      measureFormatter: (num? value) {
                        return ': ' + value.toString();
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
