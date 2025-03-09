class Category {
  final String name;
  final String icon;
  final List<Category>? ingredients; // List of ingredients inside category
  Category({this.ingredients, required this.name, required this.icon});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      icon: json['icon'],
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
  Category(name: "All", icon: "assets/icons/vegan_1.svg"),
  Category(name: "Vegan", icon: "assets/icons/chickenTest.svg"),
  Category(name: "Chicken", icon: "assets/icons/chickenTest.svg"),
  Category(name: "Chicken", icon: "assets/icons/chickenTest.svg"),
];

List<Category> ingredients = [
  Category(name: 'Salt', icon: 'assets/images/Salt.svg'),
  Category(name: 'Chicken', icon: 'assets/icons/chicken.svg'),
  Category(name: 'Onion (Allergy)', icon: 'assets/icons/onion.svg'),
  Category(name: 'Garlic', icon: 'assets/icons/garlic.svg'),
  Category(name: 'Chili pepper', icon: 'assets/icons/chili.svg'),
  Category(name: 'Broccoli', icon: 'assets/icons/broccoli.svg'),
  Category(name: 'Cucumber', icon: 'assets/icons/cucumber.svg'),
  Category(name: 'Orange', icon: 'assets/icons/orange.svg'),
  Category(name: 'Walnut', icon: 'assets/icons/walnut.svg'),
];
