import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/home_cooked__features/data/data_source/homeCooked_remote_data_source.dart';
import 'package:kamn/home_cooked__features/data/models/home_cook_model_test.dart';

import '../models/meals_model.dart';

abstract class AddHomeCookRepository {
  Future<Either<Faliure, HomeCookModel>> addHomeCookRequest(
      HomeCookModel homeCookModel);

  Future<Either<Faliure, List<MealModel>>> getMeals(String homeCookId);

  Future<Either<Faliure, void>> updateServiceProviderHomeCookAddDeliveryData(
      HomeCookModel homeCookModel);

  Future<Either<Faliure, void>> addMealModel(
      MealModel mealModel, String homeCookId);

  Future<Either<Faliure, void>> updateMealModel(
      MealModel mealModel, String homeCookId);

  Future<Either<Faliure, HomeCookModel>> getServiceProviderHomeCook();
  Future<Either<Faliure, void>> deleteMeal(
      MealModel mealModel, String homeCookId);

  Future<Either<Faliure, Map<String, List<String>>>> uploadImages(
      Map<String, List<File>> imagesMap, void Function(double) onProgress);

  Future<Either<Faliure, List<String>>> uploadMealImages(
      List<File> images, void Function(double p1) onProgress);

  Stream<Either<Faliure, List<MealModel>>> getMealsStream(String homeCookId);
}

@Injectable(as: AddHomeCookRepository)
class AddHomeCookRepositoryImpl implements AddHomeCookRepository {
  AddHomeCookRemoteDataSource dataSource;

  AddHomeCookRepositoryImpl({required this.dataSource});

  //mary

  @override
  Future<Either<Faliure, void>> updateServiceProviderHomeCookAddDeliveryData(
      HomeCookModel homeCookModel) {
    return executeTryAndCatchForRepository(() async {
      return await dataSource
          .updateServiceProviderHomeCookAddDeliveryData(homeCookModel);
    });
  }

  @override
  Future<Either<Faliure, HomeCookModel>> getServiceProviderHomeCook() {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.getServiceProviderHomeCook();
    });
  }

  @override
  Future<Either<Faliure, void>> addMealModel(
      MealModel mealModel, String homeCookId) {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.addMealModel(mealModel, homeCookId);
    });
  }

  @override
  Future<Either<Faliure, void>> updateMealModel(
      MealModel mealModel, String homeCookId) {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.updateMealModel(mealModel, homeCookId);
    });
  }

  @override
  Future<Either<Faliure, void>> deleteMeal(
      MealModel mealModel, String homeCookId) async {
    // try {
    //   await dataSource.deleteMeal(mealModel, homeCookId);
    // } catch (e) {
    //   print("oooooooooooooo $e");

    //   // return Faliure(e.toString());
    // }
    return executeTryAndCatchForRepository(() async {
      return await dataSource.deleteMeal(mealModel, homeCookId);
    });
  }

  // @override
  // Stream<List<Map<String, dynamic>>> getMealsStream() {
  //   return dataSource.getMealsStream();
  // }

// Listen to an incoming stream (await for).
// Transform its data.
// Emit new values to downstream listeners (yield).
// Catch errors gracefully and yield Left(Failure).
  @override
  Stream<Either<Faliure, List<MealModel>>> getMealsStream(
      String homeCookId) async* {
    try {
      await for (final meals in dataSource.getMealsStream(homeCookId)) {
        yield Right(meals.map((data) => MealModel.fromMap(data)).toList());
      }
    } catch (e) {
      yield Left(Faliure(e.toString()));
    }
  }

//   @override
// Future<void> deleteMeal(MealModel mealModel, String homeCookId) async {
//   try {
//     var docMeal = getMealsCollection(homeCookId).doc(mealModel.id);
//     await docMeal.delete();
//   } catch (e) {
//     throw Exception('Failed to delete meal: $e');
//   }
// }

  @override
  Future<Either<Faliure, List<MealModel>>> getMeals(String homeCookId) async {
    return executeTryAndCatchForRepository(() async {
      final meals = await dataSource.getMeals(homeCookId);
      return meals.map((data) => MealModel.fromMap(data)).toList();
    });
  }

  @override
  Future<Either<Faliure, HomeCookModel>> addHomeCookRequest(
      HomeCookModel homeCookModel) {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.addHomeCookRequest(homeCookModel);
    });
  }

  @override
  Future<Either<Faliure, Map<String, List<String>>>> uploadImages(
      Map<String, List<File>> imagesMap, void Function(double p1) onProgress) {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.uploadImages(imagesMap, onProgress);
    });
  }

  @override
  Future<Either<Faliure, List<String>>> uploadMealImages(
      List<File> images, void Function(double p1) onProgress) {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.uploadMealImages(images, onProgress);
    });
  }
}
