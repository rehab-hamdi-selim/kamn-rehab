import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget leftTiltleWidget(value, meta) {
  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: Text(
      formatNumber(value),
      style: TextStyle(color: Colors.grey), // Change axis label color
    ),
  );
}

String formatNumber(double value) {
  if (value >= 1000000000) {
    return '${(value / 1000000000).toStringAsFixed(0)}B';
  } else if (value >= 1000000) {
    return '${(value / 1000000).toStringAsFixed(0)}M';
  } else if (value >= 1000) {
    return '${(value / 1000).toStringAsFixed(0)}k';
  }
  return value.toStringAsFixed(0);
}
