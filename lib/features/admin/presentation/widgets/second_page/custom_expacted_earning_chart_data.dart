import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kamn/core/theme/app_pallete.dart';

class CustomExpactedEarningChartData extends StatelessWidget {
  const CustomExpactedEarningChartData({super.key});

  static const List<Color> gradientColors = [
    AppPallete.blueColor,
    AppPallete.blueColor,
    AppPallete.whiteColor,
    AppPallete.whiteColor
  ];
  static const List<FlSpot> spots = [
    FlSpot(0, 3),
    FlSpot(1, 3),
    FlSpot(2, 3),
    FlSpot(3, 3),
    FlSpot(2, 2),
    FlSpot(2.6, 2),
    FlSpot(4.9, 5),
    FlSpot(6.8, 3.1),
    FlSpot(8, 4),
    FlSpot(9.5, 3),
    FlSpot(11, 4),
  ];
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.90,
      child: LineChart(LineChartData(
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 6,
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true, //For Line Curve
            color: AppPallete.blueColor,
            barWidth: 3.72, // Size Of Line
            isStrokeCapRound: true,
            dotData: const FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: gradientColors
                    .map((color) => color.withOpacity(0.2))
                    .toList(),
              ),
            ),
          ),
        ],
        gridData: const FlGridData(
          show: false, // Line Inside Chart
        ),
        titlesData: const FlTitlesData(
          show: false,
        ),
        borderData: FlBorderData(
          show: false,
        ),
      )),
    );
  }
}
