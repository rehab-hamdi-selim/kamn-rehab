class Category {
  final String name;
  final String icon;

  Category({required this.name, required this.icon});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'icon': icon,
    };
  }
}


// Sample Data Lists
List<Category> categories = [
  Category(name: "All", icon: "assets/icons/vegan_1.svg"),
  Category(name: "Vegan", icon: "assets/icons/chickenTest.svg"),
  Category(name: "Chicken", icon: "assets/icons/vegan_1.svg"),
  Category(name: "Chicken", icon: "assets/icons/vegan_1.svg"),
];





