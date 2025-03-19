import 'package:flutter/material.dart';

class Feature {
  final String name;
  final int price;
  final String unit;
  final String icon;
  final Color badgeColor;

  Feature({
    required this.name,
    required this.price,
    required this.unit,
    required this.icon,
    required this.badgeColor,
  });
}
