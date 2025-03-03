class FoodItem {
  final String name;
  final String imageUrl;
  final double price;
  final int calories;
  final double rating;
  final List<String> ingredients;
  final String restaurantName;

  FoodItem({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.calories,
    required this.rating,
    required this.ingredients,
    required this.restaurantName,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: json['price'].toDouble(),
      calories: json['calories'],
      rating: json['rating'].toDouble(),
      ingredients: List<String>.from(json['ingredients']),
      restaurantName: json['restaurantName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'calories': calories,
      'rating': rating,
      'ingredients': ingredients,
      'restaurantName': restaurantName,
    };
  }
}

List<FoodItem> trendingFoods = [
  FoodItem(
    name: "Fruit Salad",
    imageUrl: "assets/images/fruit_salad.png",
    price: 150.0,
    calories: 150,
    rating: 4.7,
    ingredients: ["Apple", "Banana", "Grapes", "Orange"],
    restaurantName: "Sarah's House",
  ),
  FoodItem(
    name: "Chicken Salad",
    imageUrl: "assets/images/chicken_salad.png",
    price: 250.0,
    calories: 300,
    rating: 4.8,
    ingredients: ["Grilled Chicken", "Lettuce", "Tomato", "Cucumber"],
    restaurantName: "FitFuel Restaurant",
  ),
];

List<FoodItem> popularFoods = [
  FoodItem(
    name: "Chicken Salad",
    imageUrl: "assets/images/chicken_salad.png",
    price: 250.0,
    calories: 300,
    rating: 4.8,
    ingredients: ["Grilled Chicken", "Lettuce", "Tomato", "Cucumber"],
    restaurantName: "House of Diet",
  ),
  FoodItem(
    name: "Grilled Chicken Salad",
    imageUrl: "assets/images/grilled_chicken_salad.png",
    price: 150.0,
    calories: 250,
    rating: 4.6,
    ingredients: ["Chicken", "Broccoli", "Walnut", "Orange"],
    restaurantName: "Sarah's House",
  ),
];
