import 'package:fpdart/fpdart.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/healthy_food_features/data/models/test_meal_model.dart';

abstract class TestMealsRepository {
  Future<Either<Faliure, List<TestMealModel>>> getTestMeals();
  Future<Either<Faliure, void>> addTestMeals();
}
