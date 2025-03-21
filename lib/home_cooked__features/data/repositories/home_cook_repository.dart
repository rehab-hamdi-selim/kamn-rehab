import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/home_cooked__features/data/data_source/homeCooked_remote_data_source.dart';
import 'package:kamn/home_cooked__features/data/models/home_cook_model_test.dart';

abstract class AddHomeCookRepository {
  Future<Either<Faliure, HomeCookModel>> addHomeCookRequest(
      HomeCookModel gymRequestModel);

  Future<Either<Faliure, Map<String, List<String>>>> uploadImages(
      Map<String, List<File>> imagesMap, void Function(double) onProgress);
}

@Injectable(as: AddHomeCookRepository)
class AddHomeCookRepositoryImpl implements AddHomeCookRepository {
  AddHomeCookRemoteDataSource dataSource;

  AddHomeCookRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Faliure, HomeCookModel>> addHomeCookRequest(
      HomeCookModel gymRequestModel) {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.addCookRequest(gymRequestModel);
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
