import 'package:kamn/core/const/icon_links.dart';
import 'package:kamn/core/const/image_links.dart';
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
  Category(name: 'Salt', icon: 'assets/images/Salt.svg'),
  Category(name: 'Chicken', icon: 'assets/images/chicken_selected.svg'),
  Category(name: 'Broccoli', icon: 'assets/images/broccoli_selected.svg'),
  Category(name: 'Orange', icon: 'assets/images/Orange_selected.svg'),
  Category(name: 'Chili', icon: 'assets/images/chili_selected.svg'),
  Category(name: 'Onion', icon: 'assets/images/Onion_selected.svg'),
  Category(name: 'Garlic', icon: 'assets/images/Garlic_selected.svg'),
  Category(name: 'walnut', icon: 'assets/images/walnut_selected.svg'),
  Category(name: 'Ginger', icon: 'assets/images/Ginger_selected.svg'),
  Category(name: 'Cucumber', icon: 'assets/images/cucumber_selected.svg'),
];