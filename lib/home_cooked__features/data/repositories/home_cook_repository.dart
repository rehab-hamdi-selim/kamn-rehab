import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/home_cooked__features/data/data_source/homeCooked_remote_data_source.dart';
import 'package:kamn/home_cooked__features/data/models/gym_model_test.dart';

abstract class AddGymRepository {
  Future<Either<Faliure, HomeCookModel>> addGymRequest(
      HomeCookModel gymRequestModel);

  Future<Either<Faliure, Map<String, List<String>>>> uploadImages(
      Map<String, List<File>> imagesMap, void Function(double) onProgress);
}

@Injectable(as: AddGymRepository)
class AddGymRepositoryImpl implements AddGymRepository {
  AddHomeCookRemoteDataSource dataSource;

  AddGymRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Faliure, HomeCookModel>> addGymRequest(
      HomeCookModel gymRequestModel) {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.addGymRequest(gymRequestModel);
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
