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

  Future<Either<Faliure,List<MealModel>>> getMeals(String homeCookId);    

  Future<Either<Faliure, void>> updateServiceProviderHomeCookAddDeliveryData(
      HomeCookModel homeCookModel);

   Future<Either<Faliure, void>> addMealModel(
      MealModel mealModel, String homeCookId);

   Future<Either<Faliure, void>> updateMealModel(
      MealModel mealModel, String homeCookId);

  Future<Either<Faliure, HomeCookModel>> getServiceProviderHomeCook();

  Future<Either<Faliure, Map<String, List<String>>>> uploadImages(
      Map<String, List<File>> imagesMap, void Function(double) onProgress);
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
  Future<Either<Faliure,List<MealModel>>> getMeals(String homeCookId)
  async{
     return executeTryAndCatchForRepository(() async {
      final meals = await dataSource.getMeals(homeCookId);
    return  meals.map((data)=> MealModel.fromMap(data)).toList();
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
}
