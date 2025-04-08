import 'package:kamn/healthy_food_features/data/models/test_meal_model.dart';

class MealCartModel extends TestMealModel {
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

  @override
  MealCartModel copyWith({
    int? quantity,
    String? id,
    String? name,
    String? type,
    int? prepTime,
    int? calories,
    double? price,
    List<String>? specialtyTags,
    List<String>? ingredients,
    String? details,
    List<String>? imageUrls,
  }) {
    return MealCartModel(
      quantity: quantity ?? this.quantity,
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      prepTime: prepTime ?? this.prepTime,
      calories: calories ?? this.calories,
      price: price ?? this.price,
      specialtyTags: specialtyTags ?? this.specialtyTags,
      ingredients: ingredients ?? this.ingredients,
      details: details ?? this.details,
      imageUrls: imageUrls ?? this.imageUrls,
    );
  }

  @override
  bool operator ==(covariant MealCartModel other) {
    if (identical(this, other)) return true;

    return super == other && quantity == other.quantity;
  }

  @override
  int get hashCode => super.hashCode ^ quantity.hashCode;

  @override
  String toString() {
    return 'MealCartModel(quantity: $quantity, ${super.toString()})';
  }
}
