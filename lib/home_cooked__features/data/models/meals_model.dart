import 'package:cloud_firestore/cloud_firestore.dart';

class Meal {
  String id;
  String name;
  String type; // Breakfast, Lunch, Dinner, Snack
  int prepTime; // in minutes
  int calories;
  double price;
  List<String> specialtyTags; // Vegan, Keto, etc.
  List<String> ingredients;
  String details;
  List<String> imageUrls;
  bool isVerified;
  String verificationStatus; // Pending, Under Review, Approved
  String orderOption; // Pick-up or Delivery

  Meal({
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
    required this.isVerified,
    required this.verificationStatus,
    required this.orderOption, // Only "Pick-up" or "Delivery"
  });

  // Convert Meal object to a map for Firebase
  Map<String, dynamic> toMap() {
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
      'isVerified': isVerified,
      'verificationStatus': verificationStatus,
      'orderOption': orderOption, // Removed time/day options
    };
  }

  // Create Meal object from Firebase snapshot
  factory Meal.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return Meal(
      id: snapshot.id,
      name: data['name'] ?? '',
      type: data['type'] ?? '',
      prepTime: data['prepTime'] ?? 0,
      calories: data['calories'] ?? 0,
      price: (data['price'] ?? 0).toDouble(),
      specialtyTags: List<String>.from(data['specialtyTags'] ?? []),
      ingredients: List<String>.from(data['ingredients'] ?? []),
      details: data['details'] ?? '',
      imageUrls: List<String>.from(data['imageUrls'] ?? []),
      isVerified: data['isVerified'] ?? false,
      verificationStatus: data['verificationStatus'] ?? 'Pending',
      orderOption: data['orderOption'] ?? 'Pick-up', // Only Pick-up or Delivery
    );
  }
}

List<Meal> fakeMeals = [
  Meal(
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
    isVerified: true,
    verificationStatus: 'Approved',
    orderOption: 'Pick-up',
  ),
  Meal(
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
    isVerified: true,
    verificationStatus: 'Approved',
    orderOption: 'Delivery',
  ),
  Meal(
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
    isVerified: false,
    verificationStatus: 'Pending',
    orderOption: 'Pick-up',
  ),
];
