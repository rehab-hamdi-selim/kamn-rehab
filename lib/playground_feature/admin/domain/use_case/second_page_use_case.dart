import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/playground_feature/admin/data/models/analytics_model.dart';
import 'package:kamn/playground_feature/admin/data/models/chart_data_model.dart';
import 'package:kamn/playground_feature/admin/data/repository/second_page_repository.dart';

abstract class SecondPageUseCase {
  ChartDataModel getChartData(AnalyticsModel data);
}

@Injectable(as: SecondPageUseCase)
class SecondPageUseCaseImpl implements SecondPageUseCase {
  final SecondPageRepository repository;
  SecondPageUseCaseImpl({required this.repository});

  @override
  ChartDataModel getChartData(AnalyticsModel data) {
    List<FlSpot> spots = [];
    List<BarChartGroupData> items = [];
    double minX = double.maxFinite;
    double maxX = 0;
    double minY = double.maxFinite;
    double maxY = 0;
    int interval = 1;
    double maxY2 = 0;
    for (int i = 0; i < data.xPoints!.length; i++) {
      // Get Min Number in X and Y points
      minX = data.xPoints![i].toDouble() > minX
          ? minX
          : data.xPoints![i].toDouble();
      minY = data.yPoints![i].toDouble() > minY
          ? minY
          : data.yPoints![i].toDouble();

      // Get Max Number in X and Y points
      maxX = data.xPoints![i].toDouble() > maxX
          ? data.xPoints![i].toDouble()
          : maxX;
      maxY = data.yPoints![i].toDouble() > maxY
          ? data.yPoints![i].toDouble()
          : maxY;
      // Get Max Of y1 and y2
      maxY2 = data.yPoints![i].toDouble() > maxY2
          ? data.yPoints![i].toDouble()
          : maxY2;
      maxY2 = data.yPoints2![i].toDouble() > maxY2
          ? data.yPoints2![i].toDouble()
          : maxY2;
      // Add Item to Expacted Earning Chart
      spots.add(
          FlSpot(data.xPoints![i].toDouble(), data.yPoints![i].toDouble()));

      // Add Item to Analytivs Chart
      items.add(BarChartGroupData(
        barsSpace: 4,
        x: data.xPoints![i].toInt(),
        barRods: [
          BarChartRodData(
            toY: data.yPoints![i].toDouble(),
            color: AppPallete.lightBlueColor2,
            width: 8.74.w,
          ),
          BarChartRodData(
            toY: data.yPoints2![i].toDouble(),
            color: AppPallete.accentBlackColor,
            width: 8.74.w,
          ),
        ],
      ));
    }
    // Use Ceil to round up number
    interval = ((minY + maxY2) / 5).ceil();
    return ChartDataModel(
        spots: spots,
        items: items,
        interval: interval.toDouble(),
        maxX: maxX,
        maxY: maxY,
        maxY2: maxY2,
        minX: minX,
        minY: minY);
  }
}
