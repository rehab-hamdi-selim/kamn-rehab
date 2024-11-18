import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomAnalyticsChartData extends StatelessWidget {
  CustomAnalyticsChartData({super.key});

  late List<BarChartGroupData> items = [
    makeGroupData(0, 75, 100),
    makeGroupData(1, 160, 140),
    makeGroupData(2, 190, 160),
    makeGroupData(3, 200, 220),
  ];
  final double maxY = 250;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.60,
          child: BarChart(
            BarChartData(
              maxY: maxY,
              //  Show Title
              titlesData: FlTitlesData(
                show: true,
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: bottomTitles,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 33,
                    interval: 50,
                    getTitlesWidget: leftTitles,
                  ),
                ),
              ),

              // Appear Border
              borderData: FlBorderData(
                show: false,
              ),

              // Number of Item
              barGroups: items,
              // Apear Line in Chart
              gridData: const FlGridData(show: false),
            ),
          ),
        ),
      ],
    );
  }

  Widget leftTitles(double yValue, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text('${yValue.toInt().toString()}k',
          style: TextStyles.fontInter11GreyMedium),
    );
  }

  Widget bottomTitles(double xValue, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 6, //margin top
      child: Text(
        'weak ${xValue.toInt() + 1}',
        style: TextStyles.fontInter11GreyMedium,
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: AppPallete.lightBlueColor2,
          width: 8.74.w,
        ),
        BarChartRodData(
          toY: y2,
          color: AppPallete.accentBlackColor,
          width: 8.74.w,
        ),
      ],
    );
  }
}
