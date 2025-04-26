import 'package:kamn/core/const/icon_links.dart';
import 'package:kamn/healthy_food_features/data/models/food_item_model.dart';

class Category {
  final String name;
  final String icon;
  final List<FoodItem>? foodItems;
  final List<Category>? ingredients;

  Category(
      {this.foodItems,
      required this.name,
      required this.icon,
      this.ingredients});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      icon: json['icon'],
      foodItems: json['foodItems'],
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((item) => Category.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'icon': icon,
      'ingredients': ingredients?.map((e) => e.toJson()).toList(),
    };
  }
}

// Sample Data Lists
List<Category> categories = [
  Category(name: "All", icon: "assets/icons/vegan_1.svg", foodItems: homeCooks),
  Category(
      name: "Vegan",
      icon: IconLinks.vegan, //"assets/icons/chickenTest.svg",
      foodItems: trendingFoods),
  Category(name: "Chicken", icon: IconLinks.chickenleg, foodItems: homeCooks),
  Category(name: "meats", icon: IconLinks.steak, foodItems: trendingFoods),
];

List<Category> ingredients = [
  // Category(name: 'Salt', icon: 'assets/images/Salt.svg'),
  // Category(name: 'Chicken', icon: 'assets/icons/chicken.svg'),
  // Category(name: 'Onion (Allergy)', icon: 'assets/icons/onion.svg'),
  // Category(name: 'Garlic', icon: 'assets/icons/garlic.svg'),
  // // Category(name: 'Chili pepper', icon: 'assets/icons/chili.svg'),
  // // Category(name: 'Broccoli', icon: 'assets/icons/broccoli.svg'),
  // // Category(name: 'Cucumber', icon: 'assets/icons/cucumber.svg'),
  // Category(name: 'Orange', icon: 'assets/icons/orange.svg'),
  // Category(name: 'Walnut', icon: 'assets/icons/walnut.svg'),
];
