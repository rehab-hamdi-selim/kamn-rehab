// // import 'package:kamn/healthy_food_features/data/models/test_meal_model.dart';

// // class MealCartModel extends TestMealModel {
// //   final int quantity;

// //   const MealCartModel({
// //     required this.quantity,
// //     required super.id,
// //     required super.name,
// //     required super.type,
// //     required super.prepTime,
// //     required super.calories,
// //     required super.price,
// //     required super.specialtyTags,
// //     required super.ingredients,
// //     required super.details,
// //     required super.imageUrls,
// //   });

// //   @override
// //   MealCartModel copyWith({
// //     int? quantity,
// //     String? id,
// //     String? name,
// //     String? type,
// //     int? prepTime,
// //     int? calories,
// //     double? price,
// //     List<String>? specialtyTags,
// //     List<String>? ingredients,
// //     String? details,
// //     List<String>? imageUrls,
// //   }) {
// //     return MealCartModel(
// //       quantity: quantity ?? this.quantity,
// //       id: id ?? this.id,
// //       name: name ?? this.name,
// //       type: type ?? this.type,
// //       prepTime: prepTime ?? this.prepTime,
// //       calories: calories ?? this.calories,
// //       price: price ?? this.price,
// //       specialtyTags: specialtyTags ?? this.specialtyTags,
// //       ingredients: ingredients ?? this.ingredients,
// //       details: details ?? this.details,
// //       imageUrls: imageUrls ?? this.imageUrls,
// //     );
// //   }

// //   @override
// //   bool operator ==(covariant MealCartModel other) {
// //     if (identical(this, other)) return true;

// //     return super == other && quantity == other.quantity;
// //   }

// //   @override
// //   int get hashCode => super.hashCode ^ quantity.hashCode;

// //   @override
// //   String toString() {
// //     return 'MealCartModel(quantity: $quantity, ${super.toString()})';
// //   }
// // }
// import 'package:kamn/healthy_food_features/data/models/test_meal_model.dart';

// class MealCartModel extends TestMealModel {
//   final int quantity;

//   const MealCartModel({
//     required this.quantity,
//     required super.id,
//     required super.name,
//     required super.type,
//     required super.prepTime,
//     required super.calories,
//     required super.price,
//     required super.specialtyTags,
//     required super.ingredients,
//     required super.details,
//     required super.imageUrls,
//   });

//   // دالة fromJson لتحويل البيانات من JSON إلى MealCartModel
//   factory MealCartModel.fromJson(Map<String, dynamic> json) {
//     return MealCartModel(
//       quantity:
//           json['quantity'] ?? 1, // إذا لم تكن موجودة، نضع القيمة الافتراضية 1
//       id: json['id'],
//       name: json['name'],
//       type: json['type'],
//       prepTime: json['prepTime'],
//       calories: json['calories'],
//       price: (json['price'] as num).toDouble(),
//       specialtyTags: List<String>.from(json['specialtyTags']),
//       ingredients: List<String>.from(json['ingredients']),
//       details: json['details'],
//       imageUrls: List<String>.from(json['imageUrls']),
//     );
//   }

//   // دالة toJson لتحويل MealCartModel إلى JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'quantity': quantity,
//       'id': id,
//       'name': name,
//       'type': type,
//       'prepTime': prepTime,
//       'calories': calories,
//       'price': price,
//       'specialtyTags': specialtyTags,
//       'ingredients': ingredients,
//       'details': details,
//       'imageUrls': imageUrls,
//     };
//   }

//   @override
//   MealCartModel copyWith({
//     int? quantity,
//     String? id,
//     String? name,
//     String? type,
//     int? prepTime,
//     int? calories,
//     double? price,
//     List<String>? specialtyTags,
//     List<String>? ingredients,
//     String? details,
//     List<String>? imageUrls,
//   }) {
//     return MealCartModel(
//       quantity: quantity ?? this.quantity,
//       id: id ?? this.id,
//       name: name ?? this.name,
//       type: type ?? this.type,
//       prepTime: prepTime ?? this.prepTime,
//       calories: calories ?? this.calories,
//       price: price ?? this.price,
//       specialtyTags: specialtyTags ?? this.specialtyTags,
//       ingredients: ingredients ?? this.ingredients,
//       details: details ?? this.details,
//       imageUrls: imageUrls ?? this.imageUrls,
//     );
//   }

//   @override
//   bool operator ==(covariant MealCartModel other) {
//     if (identical(this, other)) return true;

//     return super == other && quantity == other.quantity;
//   }

//   @override
//   int get hashCode => super.hashCode ^ quantity.hashCode;

//   @override
//   String toString() {
//     return 'MealCartModel(quantity: $quantity, ${super.toString()})';
//   }
// }
import 'package:kamn/healthy_food_features/data/models/test_meal_model.dart';

class MealCartModel extends TestMealModel {
  @override
  final int quantity;

  const MealCartModel({
    required this.quantity,
    required super.id,
    required super.name,
    required super.type,
    required super.prepTime,
    required super.calories,
    required super.price,
    required super.specialtyTags,
    required super.ingredients,
    required super.details,
    required super.imageUrls,
  });

  double get totalPrice => price * quantity;

  static double getTotal(List<MealCartModel> cartItems) {
    double total = 0;
    for (var item in cartItems) {
      total += item.totalPrice;
    }
    return total;
  }

  factory MealCartModel.fromJson(Map<String, dynamic> json) {
    return MealCartModel(
      quantity: json['quantity'] ?? 1,
      id: json['id'],
      name: json['name'],
      type: json['type'],
      prepTime: json['prepTime'],
      calories: json['calories'],
      price: (json['price'] as num).toDouble(),
      specialtyTags: List<String>.from(json['specialtyTags']),
      ingredients: List<String>.from(json['ingredients']),
      details: json['details'],
      imageUrls: List<String>.from(json['imageUrls']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quantity': quantity,
      'id': id,
      'name': name,
      'type': type,
      'prepTime': prepTime,
      'calories': calories,
      'price': price,
      'specialtyTags': specialtyTags,
      'ingredients': ingredients,
      'details': details,
      'imageUrls': imageUrls,
    };
  }
}
