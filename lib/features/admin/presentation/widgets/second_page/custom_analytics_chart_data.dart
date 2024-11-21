import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/admin/presentation/cubits/second_page_cubit/second_page_cubit.dart';

class CustomAnalyticsChartData extends StatelessWidget {
  const CustomAnalyticsChartData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.60,
          child: BarChart(
            BarChartData(
              maxY: SecondPageCubit.get(context).chartDataModel.maxY2,
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
                    interval:
                        SecondPageCubit.get(context).chartDataModel.interval,
                    getTitlesWidget: leftTitles,
                  ),
                ),
              ),

              // Appear Border
              borderData: FlBorderData(
                show: false,
              ),

              // Number of Item
              barGroups: SecondPageCubit.get(context).chartDataModel.items,
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
}
