import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kamn/features/admin/presentation/widgets/first_analytics_page/chart_left_title_widget.dart';
import 'package:kamn/features/admin/presentation/widgets/first_analytics_page/chart_bottom_title_widget.dart';

Widget chartWidget() {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 0,
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 0),
            ],
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8)),
            color: Colors.white),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16, 16, 0),
          child: LineChart(LineChartData(
            minX: 0,
            maxX: 11,
            minY: 0,
            lineBarsData: [
              LineChartBarData(
                  spots: [
                    FlSpot(2, 5),
                    FlSpot(3, 5),
                    FlSpot(4, 15),
                    FlSpot(6, 9),
                    FlSpot(8, 25),
                    FlSpot(11, 15),
                  ],
                  color: Color(0xff2563EB),
                  isCurved: true,
                  preventCurveOverShooting: true,
                  dotData: FlDotData(show: false)),
            ],
            titlesData: FlTitlesData(
                rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                  showTitles: false,
                )),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                  getTitlesWidget: bottomTitleWidgets,
                  showTitles: true,
                )),
                leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: leftTiltleWidget))),
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            clipData: FlClipData.all(),
          )),
        ),
      ),
    ),
  );
}
