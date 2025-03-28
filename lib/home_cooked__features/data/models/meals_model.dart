// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';


class MealModel {
  String id;
  String name;
  String type; // Breakfast, Lunch, Dinner, Snack
  int prepTime; // in minutes
  int calories;
  double price;
  List<dynamic> specialtyTags; // Vegan, Keto, etc.
  List<dynamic> ingredients;
  String details;
  List<dynamic> imageUrls;
  MealModel({
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



  MealModel copyWith({
    String? id,
    String? name,
    String? type,
    int? prepTime,
    int? calories,
    double? price,
    List<dynamic>? specialtyTags,
    List<dynamic>? ingredients,
    String? details,
    List<dynamic>? imageUrls,
  }) {
    return MealModel(
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
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

  factory MealModel.fromMap(Map<String, dynamic> map) {
    return MealModel(
      id: map['id'] as String,
      name: map['name'] as String,
      type: map['type'] as String,
      prepTime: map['prepTime'] as int,
      calories: map['calories'] as int,
      price: map['price'] as double,
      specialtyTags: List<dynamic>.from((map['specialtyTags'] as List<dynamic>)),
      ingredients: List<dynamic>.from((map['ingredients'] as List<dynamic>)),
      details: map['details'] as String,
      imageUrls: List<dynamic>.from((map['imageUrls'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory MealModel.fromJson(String source) => MealModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Meal(id: $id, name: $name, type: $type, prepTime: $prepTime, calories: $calories, price: $price, specialtyTags: $specialtyTags, ingredients: $ingredients, details: $details, imageUrls: $imageUrls)';
  }

  @override
  bool operator ==(covariant MealModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.type == type &&
      other.prepTime == prepTime &&
      other.calories == calories &&
      other.price == price &&
      listEquals(other.specialtyTags, specialtyTags) &&
      listEquals(other.ingredients, ingredients) &&
      other.details == details &&
      listEquals(other.imageUrls, imageUrls);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      type.hashCode ^
      prepTime.hashCode ^
      calories.hashCode ^
      price.hashCode ^
      specialtyTags.hashCode ^
      ingredients.hashCode ^
      details.hashCode ^
      imageUrls.hashCode;
  }



  // Create Meal object from Firebase snapshot
  factory MealModel.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return MealModel(
      id: snapshot.id,
      name: data['name'] ?? '',
      type: data['type'] ?? '',
      prepTime: data['prepTime'] ?? 0,
      calories: data['calories'] ?? 0,
      price: (data['price'] ?? 0).toDouble(),
      specialtyTags: List<dynamic>.from(data['specialtyTags'] ?? []),
      ingredients: List<dynamic>.from(data['ingredients'] ?? []),
      details: data['details'] ?? '',
      imageUrls: List<dynamic>.from(data['imageUrls'] ?? []),
   
    );
  }
}

Future<MealModel> getmealbyid(int id) async {
  await Future.delayed(Duration(seconds: 2));
  return fakeMeals.firstWhere((element) => element.id == id.toString());
}

List<MealModel> fakeMeals = [
  MealModel(
 
    id: '1',
    name: 'Keto Avocado Bowl',
    type: 'Breakfast',
    prepTime: 30,
    calories: 500,
    price: 150.0,
    specialtyTags: ['High-Protein', 'Keto', 'Vegan'],
    ingredients: ['Avocado', 'Salt', 'Chicken', 'Garlic', 'Chili Pepper'],
    details:
        'A delicious and nutritious keto-friendly avocado bowl, perfect for a low-carb diet.',
    imageUrls: [
      "assets/images/meal_info_img.png"
      "assets/images/meal_info_img.png"
      "assets/images/meal_info_img.png"
    ],
 
  ),
  MealModel(
 
    id: '2',
    name: 'Quinoa Salad with Grilled Chicken',
    type: 'Lunch',
    prepTime: 25,
    calories: 400,
    price: 250.0,
    specialtyTags: ['High-Protein', 'Keto', 'Vegan'],
    ingredients: ['Quinoa', 'Grilled Chicken', 'Cucumber', 'Walnut'],
    details:
        'A light and healthy quinoa salad with grilled chicken, packed with protein and essential nutrients.',
    imageUrls: [
      'https://example.com/images/quinoa_salad_1.jpg',
      'https://example.com/images/quinoa_salad_2.jpg'
    ],
  
  ),
  MealModel(
  
    id: '3',
    name: 'Green Detox Smoothie',
    type: 'Snack',
    prepTime: 15,
    calories: 150,
    price: 50.0,
    specialtyTags: ['Vegan', 'Low-Carb'],
    ingredients: ['Broccoli', 'Cucumber', 'Orange'],
    details:
        'A refreshing detox smoothie packed with vitamins and nutrients for a healthy boost.',
    imageUrls: [
      'https://example.com/images/detox_smoothie_1.jpg',
      'https://example.com/images/detox_smoothie_2.jpg'
    ],

  ),
];
