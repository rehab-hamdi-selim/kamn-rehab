import 'package:kamn/core/common/entities/meal_cart_model.dart';
import 'package:kamn/healthy_food_features/data/models/test_meal_model.dart';

// دالة لتحويل TestMealModel إلى MealCartModel
MealCartModel convertToMealCartModel(TestMealModel testMeal) {
  return MealCartModel(
    quantity:
        testMeal.quantity, // افتراضًا أن TestMealModel يحتوي على حقل `quantity`
    id: testMeal.id,
    name: testMeal.name,
    type: testMeal.type,
    prepTime: testMeal.prepTime,
    calories: testMeal.calories,
    price: testMeal.price,
    specialtyTags: testMeal.specialtyTags,
    ingredients: testMeal.ingredients,
    details: testMeal.details,
    imageUrls: testMeal.imageUrls,
  );
}
