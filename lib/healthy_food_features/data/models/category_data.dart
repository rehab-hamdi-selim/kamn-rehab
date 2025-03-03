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
  Category(name: "All", icon: "assets/icons/all.png"),
  Category(name: "Vegan", icon: "assets/icons/vegan.png"),
  Category(name: "Chicken", icon: "assets/icons/chicken.png"),
  Category(name: "Chicken", icon: "assets/icons/chicken.png"),
];





