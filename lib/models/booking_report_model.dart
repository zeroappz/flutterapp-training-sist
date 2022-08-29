import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutterapp/values/app_lib.dart';

class BookingReportModel {
  final String year;
  final int salesCount;
  final charts.Color color;

  BookingReportModel(this.year, this.salesCount, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
