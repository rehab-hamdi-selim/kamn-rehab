import 'package:fl_chart/fl_chart.dart';

class ChartDataModel {
  List<FlSpot> spots;
  List<BarChartGroupData> items;
  double interval;
  double minX;
  double maxX;
  double minY;
  double maxY;
  double maxY2;
  ChartDataModel(
      {required this.spots,
      required this.items,
      required this.interval,
      required this.maxX,
      required this.maxY,
      required this.maxY2,
      required this.minX,
      required this.minY});
}
