class Restaurant {
  final String name;
  final String imageUrl;
  final double rating;
  final String description;
  final List<String> tags;
  final double minPrice;
  final double maxPrice;
  final int deliveryTime;

  Restaurant({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.description,
    required this.tags,
    required this.minPrice,
    required this.maxPrice,
    required this.deliveryTime,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      name: json['name'],
      imageUrl: json['imageUrl'],
      rating: json['rating'].toDouble(),
      description: json['description'],
      tags: List<String>.from(json['tags']),
      minPrice: json['minPrice'].toDouble(),
      maxPrice: json['maxPrice'].toDouble(),
      deliveryTime: json['deliveryTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'rating': rating,
      'description': description,
      'tags': tags,
      'minPrice': minPrice,
      'maxPrice': maxPrice,
      'deliveryTime': deliveryTime,
    };
  }
}

List<Restaurant> restaurants = [
  Restaurant(
    name: "House of Diet",
    imageUrl: "assets/images/resturantTest.png",
    rating: 4.8,
    description: "Specializes in high-protein and low-carb meals.",
    tags: ["Organic Ingredients", "High-Protein", "Grain"],
    minPrice: 500,
    maxPrice: 1500,
    deliveryTime: 30,
  ),
  Restaurant(
    name: "FitFuel Restaurant",
    imageUrl: "assets/images/resturantTest.png",
    rating: 4.7,
    description: "Perfect choice for healthy eating.",
    tags: ["Meal Prep", "High-Protein", "Vegan Balance"],
    minPrice: 300,
    maxPrice: 2500,
    deliveryTime: 35,
  ),
  Restaurant(
    name: "FitFuel Restaurant",
    imageUrl: "assets/images/resturantTest.png",
    rating: 4.7,
    description: "Perfect choice for healthy eating.",
    tags: ["Meal Prep", "High-Protein", "Vegan Balance"],
    minPrice: 300,
    maxPrice: 2500,
    deliveryTime: 35,
  ),
];
