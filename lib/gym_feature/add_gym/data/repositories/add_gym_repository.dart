import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/gym_feature/add_gym/data/datasources/add_gym_remote_data_source.dart';
import 'package:kamn/gym_feature/add_gym/data/models/gym_model.dart';

abstract class AddGymRepository {
  Future<Either<Faliure,GymRequestModel>> addGymRequest(GymRequestModel gymRequestModel);
  Future<Either<Faliure,Map<String, List<String>>>> uploadImages(
      Map<String, List<File>> imagesMap, void Function(int) onProgress);
}
@Injectable(as: AddGymRepository)
class AddGymRepositoryImpl implements AddGymRepository {
AddGymRemoteDataSource dataSource;
  AddGymRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Faliure, GymRequestModel>> addGymRequest(GymRequestModel gymRequestModel) {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.addGymRequest(gymRequestModel);
    });
  }

  @override
  Future<Either<Faliure, Map<String, List<String>>>> uploadImages(Map<String, List<File>> imagesMap, void Function(int p1) onProgress) {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.uploadImages(imagesMap,onProgress);
    });
  }}
