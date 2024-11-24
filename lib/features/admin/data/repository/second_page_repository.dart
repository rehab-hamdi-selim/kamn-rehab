import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/features/admin/data/data_source/second_page_data_source.dart';
import 'package:kamn/features/admin/data/models/analytics_model.dart';
import 'package:kamn/features/admin/data/models/chart_data_model.dart';

abstract class SecondPageRepository {
  Future<Either<Faliure, AnalyticsModel>> getSecondPageData();
  ChartDataModel getChartData(AnalyticsModel data);
}

@Injectable(as: SecondPageRepository)
class SecondPageRepositoryImpl implements SecondPageRepository {
  final SecondPageDataSource secondPageDataSource;
  SecondPageRepositoryImpl({required this.secondPageDataSource});
  @override
  Future<Either<Faliure, AnalyticsModel>> getSecondPageData() async {
    var data = await secondPageDataSource.secondPageDataSource();
    return executeTryAndCatchForRepository(() async {
      return AnalyticsModel.fromJson(data);
    });
  }

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
