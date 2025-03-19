import 'dart:convert';

import 'package:flutter/foundation.dart';

class PlanModel {
  final String subtitle;
  final String title;
  final String pricelineThrough;
  final String price;
  final String discount;
  final List<String> features;
  PlanModel({
    required this.subtitle,
    required this.title,
    required this.pricelineThrough,
    required this.price,
    required this.discount,
    required this.features,
  });
  static List<PlanModel> fakeList = [
    PlanModel(
        subtitle: "1 Month",
        title: "Monthly Plan",
        pricelineThrough: "2000 £GP",
        price: "1200 £GP",
        discount: "50%",
        features: [
          '🏋️ Access to all gym facilities',
          '🧘 Free group classes (up to 5 per month)',
          '🔒 Complimentary locker access',
          '💨 Sauna access included',
        ]),
    PlanModel(
        subtitle: '1 Month',
        title: 'Quarterly Plan',
        pricelineThrough: '32000 £GP',
        price: '16000 £GP',
        discount: '74% off',
        features: [
          '🏋️ Access to all gym facilities',
          '🧘 Free group classes (up to 5 per month)',
          '🔒 Complimentary locker access',
          '💨 Sauna access included',
          '🛁 Hot tub access for relaxation',
          '🎉 Exclusive seasonal fitness events'
        ]),
    PlanModel(
        subtitle: '1 year + 3 Month free',
        title: 'Annual Plan',
        pricelineThrough: '52000 £GP',
        price: '32000 £GP',
        discount: '86% off',
        features: [
          '🏋️ Access to all gym facilities',
          '🧘 Free group classes (up to 5 per month)',
          '🔒 Complimentary locker access',
          '💨 Sauna access included',
          '🛁 Hot tub access for relaxation',
          '🎉 Exclusive seasonal fitness events',
          '🛍️ 15% discount on all gym merchandise',
          '🏅 4 personal training sessions included',
        ])
  ];

  PlanModel copyWith({
    String? subtitle,
    String? title,
    String? pricelineThrough,
    String? price,
    String? discount,
    List<String>? features,
  }) {
    return PlanModel(
      subtitle: subtitle ?? this.subtitle,
      title: title ?? this.title,
      pricelineThrough: pricelineThrough ?? this.pricelineThrough,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      features: features ?? this.features,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subtitle': subtitle,
      'title': title,
      'pricelineThrough': pricelineThrough,
      'price': price,
      'discount': discount,
      'features': features,
    };
  }

  factory PlanModel.fromMap(Map<String, dynamic> map) {
    return PlanModel(
        subtitle: map['subtitle'] as String,
        title: map['title'] as String,
        pricelineThrough: map['pricelineThrough'] as String,
        price: map['price'] as String,
        discount: map['discount'] as String,
        features: List<String>.from(
          (map['features'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory PlanModel.fromJson(String source) =>
      PlanModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PlanModel(subtitle: $subtitle, title: $title, pricelineThrough: $pricelineThrough, price: $price, discount: $discount, features: $features)';
  }

  @override
  bool operator ==(covariant PlanModel other) {
    if (identical(this, other)) return true;

    return other.subtitle == subtitle &&
        other.title == title &&
        other.pricelineThrough == pricelineThrough &&
        other.price == price &&
        other.discount == discount &&
        listEquals(other.features, features);
  }

  @override
  int get hashCode {
    return subtitle.hashCode ^
        title.hashCode ^
        pricelineThrough.hashCode ^
        price.hashCode ^
        discount.hashCode ^
        features.hashCode;
  }
}
