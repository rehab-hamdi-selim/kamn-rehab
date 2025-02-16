import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/playground_feature/admin/presentation/cubits/second_page_cubit/second_page_cubit.dart';
import 'package:kamn/playground_feature/admin/presentation/cubits/second_page_cubit/second_page_state.dart';

class CustomExpactedEarningChartData extends StatelessWidget {
  const CustomExpactedEarningChartData({super.key});
  static const List<Color> gradientColors = [
    AppPallete.blueColor,
    AppPallete.whiteColor
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecondPageCubit, SecondPageState>(
      builder: (context, state) {
        return AspectRatio(
          aspectRatio: 1.90,
          child: LineChart(LineChartData(
            minX: state.data!.minX,
            maxX: state.data!.maxX,
            minY: state.data!.minY,
            maxY: state.data!.maxY,
            lineBarsData: [
              LineChartBarData(
                spots: state.data!.spots,
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
      },
    );
  }
}
