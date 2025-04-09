import 'package:equatable/equatable.dart';

class TestMealModel extends Equatable {
  final String id;
  final String name;
  final String type;
  final int prepTime;
  final int calories;
  final double price;
  final List<String> specialtyTags;
  final List<String> ingredients;
  final String details;
  final List<String> imageUrls;

  const TestMealModel({
    required this.id,
    required this.name,
    required this.type,
    required this.prepTime,
    required this.calories,
    required this.price,
    required this.specialtyTags,
    required this.ingredients,
    required this.details,
    required this.imageUrls,
  });

  factory TestMealModel.fromJson(Map<String, dynamic> json) {
    return TestMealModel(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      prepTime: json['prepTime'] as int,
      calories: json['calories'] as int,
      price: (json['price'] as num).toDouble(),
      specialtyTags: List<String>.from(json['specialtyTags'] ?? []),
      ingredients: List<String>.from(json['ingredients'] ?? []),
      details: json['details'] as String,
      imageUrls: List<String>.from(json['imageUrls'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
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

  TestMealModel copyWith({
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
    return TestMealModel(
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
  List<Object?> get props => [
        id,
        name,
        type,
        prepTime,
        calories,
        price,
        specialtyTags,
        ingredients,
        details,
        imageUrls,
      ];
}
