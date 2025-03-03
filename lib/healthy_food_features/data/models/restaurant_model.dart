class Restaurant {
  final String name;
  final String imageUrl;
  final double rating;
  final String description;
  final double deliveryTime;

  Restaurant({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.description,
    required this.deliveryTime,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      name: json['name'],
      imageUrl: json['imageUrl'],
      rating: json['rating'].toDouble(),
      description: json['description'],
      deliveryTime: json['deliveryTime'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'rating': rating,
      'description': description,
      'deliveryTime': deliveryTime,
    };
  }
}

List<Restaurant> restaurants = [
  Restaurant(
    name: "House of Diet",
    imageUrl: "assets/images/house_of_diet.png",
    rating: 4.7,
    description: "Healthy food & nutrition services",
    deliveryTime: 25.0,
  ),
  Restaurant(
    name: "FitFuel Restaurant",
    imageUrl: "assets/images/fitfuel_restaurant.png",
    rating: 4.6,
    description: "Perfect choice for healthy eating",
    deliveryTime: 30.0,
  ),
  Restaurant(
    name: "FitFuel Restaurant",
    imageUrl: "assets/images/fitfuel_restaurant.png",
    rating: 4.6,
    description: "Perfect choice for healthy eating",
    deliveryTime: 30.0,
  ),
  Restaurant(
    name: "FitFuel Restaurant",
    imageUrl: "assets/images/fitfuel_restaurant.png",
    rating: 4.6,
    description: "Perfect choice for healthy eating",
    deliveryTime: 30.0,
  ),
];
