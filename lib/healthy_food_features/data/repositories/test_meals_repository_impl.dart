import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/healthy_food_features/data/data_sources/test_meals_data_source.dart';
import 'package:kamn/healthy_food_features/data/models/test_meal_model.dart';
import 'package:kamn/healthy_food_features/domain/repositories/test_meals_repository.dart';

@Injectable(as: TestMealsRepository)
class TestMealsRepositoryImpl implements TestMealsRepository {
  final TestMealsDataSource _dataSource;

  TestMealsRepositoryImpl(this._dataSource);

  @override
  Future<Either<Faliure, List<TestMealModel>>> getTestMeals() {
    return executeTryAndCatchForRepository(() async {
      return await _dataSource.getTestMeals();
    });
  }

  @override
  Future<Either<Faliure, void>> addTestMeals() {
    return executeTryAndCatchForRepository(() async {
      return await _dataSource.addTestMeals();
    });
  }
}
