import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kamn/core/common/entities/meal_cart_model.dart';

class OrderModel {
  final String orderId;
  final String userId;
  final List<MealCartModel> meals;
  final String status;
  final double total;
  final DateTime createdAt;

  OrderModel({
    required this.orderId,
    required this.userId,
    required this.meals,
    required this.status,
    required this.total,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'userId': userId,
      'meals': meals.map((e) => e.toJson()).toList(),
      'status': status,
      'total': total,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['orderId'],
      userId: json['userId'],
      meals: (json['meals'] as List)
          .map((e) => MealCartModel.fromJson(e))
          .toList(),
      status: json['status'],
      total: json['total'].toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:kamn/core/common/entities/meal_cart_model.dart';

// class OrderModel {
//   final String orderId;
//   final List<MealCartModel> items;
//   final String userId;
//   final DateTime dateTime;
//   final String status;

//   OrderModel({
//     required this.orderId,
//     required this.items,
//     required this.userId,
//     required this.dateTime,
//     required this.status,
//   });

//   factory OrderModel.fromJson(Map<String, dynamic> json) {
//     return OrderModel(
//       orderId: json['orderId'],
//       userId: json['userId'],
//       items: (json['meals'] as List)
//           .map((e) => MealCartModel.fromJson(e))
//           .toList(),
//       status: json['status'],
//       dateTime: (json['createdAt'] as Timestamp).toDate(),
//     );
//   }
// }
