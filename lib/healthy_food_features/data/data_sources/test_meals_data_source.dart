import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/healthy_food_features/data/models/test_meal_model.dart';

abstract class TestMealsDataSource {
  Future<List<TestMealModel>> getTestMeals();
  Future<void> addTestMeals();
}

@Injectable(as: TestMealsDataSource)
class TestMealsDataSourceImpl implements TestMealsDataSource {
  final FirebaseFirestore _firestore;

  TestMealsDataSourceImpl(this._firestore);

  @override
  Future<List<TestMealModel>> getTestMeals() async {
    try {
      final querySnapshot = await _firestore.collection('test_meals').get();
      return querySnapshot.docs
          .map((doc) => TestMealModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to get test meals: $e');
    }
  }

  @override
  Future<void> addTestMeals() async {
    try {
      const imageUrl =
          'https://firebasestorage.googleapis.com/v0/b/kamn-5ad5c.appspot.com/o/salad_1.png?alt=media';
      final mealTypes = ['Breakfast', 'Lunch', 'Dinner', 'Snack'];
      final specialtyTags = [
        ['High-Protein', 'Keto', 'Low-Carb'],
        ['Vegan', 'Gluten-Free', 'Organic'],
        ['Vegetarian', 'Dairy-Free', 'Low-Fat'],
        ['Paleo', 'Sugar-Free', 'Allergen-Free']
      ];

      final meals = List.generate(50, (index) {
        final mealType = mealTypes[index % mealTypes.length];
        final tags = specialtyTags[index % specialtyTags.length];

        return {
          'id': 'meal_${index + 1}',
          'name': 'Test Meal ${index + 1}',
          'type': mealType,
          'prepTime': 15 + (index % 45), // 15-60 minutes
          'calories': 150 + (index * 10) % 850, // 150-1000 calories
          'price': (50.0 + (index * 5)) % 300, // 50-350 price
          'specialtyTags': tags,
          'ingredients': [
            'Ingredient 1',
            'Ingredient 2',
            'Ingredient 3',
            'Ingredient ${4 + (index % 7)}' // Add some variety
          ],
          'details':
              'This is a delicious test meal number ${index + 1}. Created for testing purposes with various attributes.',
          'imageUrls': [imageUrl]
        };
      });

      final batch = _firestore.batch();
      final testMealsCollection = _firestore.collection('test_meals');

      for (var meal in meals) {
        final docRef = testMealsCollection.doc();
        batch.set(docRef, meal);
      }

      await batch.commit();
    } catch (e) {
      throw Exception('Failed to add test meals: $e');
    }
  }
}
