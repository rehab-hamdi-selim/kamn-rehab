import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/gym_feature/add_gym/data/datasources/add_gym_remote_data_source.dart';
import 'package:kamn/gym_feature/add_gym/data/models/gym_request_model.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';

abstract class AddGymRepository {
  Future<Either<Faliure,GymRequestModel>> addGymRequest(GymRequestModel gymRequestModel);
  Future<Either<Faliure,Map<String, List<String>>>> uploadImages(
      Map<String, List<File>> imagesMap, void Function(double) onProgress);
  Future<Either<Faliure, GymRequestModel?>> getGymById(String gymId);
  Future<Either<Faliure,List<GymRequestModel>>> getAllGyms();
  Future<Either<Faliure, void>> addGymFeatures(String gymId, List<Feature> features);
  Future<Either<Faliure, List<Feature>>> getFeaturesOfSpecificGym(String gymId);
    Future<Either<Faliure,void>> addGymPlan(String gymId,Plan plan);



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
  Future<Either<Faliure, Map<String, List<String>>>> uploadImages(Map<String, List<File>> imagesMap, void Function(double p1) onProgress) {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.uploadImages(imagesMap,onProgress);
    });
  }
  
  @override
  Future<Either<Faliure, GymRequestModel?>> getGymById(String gymId) {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.getGymById(gymId);
    });
  }
  
  @override
  Future<Either<Faliure, List<GymRequestModel>>> getAllGyms() {
    return executeTryAndCatchForRepository(() async {
      final rawData= await dataSource.getAllGyms();
      return rawData.map((element) => GymRequestModel.fromMap(element)).toList();
    });
  }
  
  @override
  Future<Either<Faliure, void>> addGymFeatures(String gymId, List<Feature> features) {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.addGymFeatures(gymId, features);
    });
  }
  
  @override
  Future<Either<Faliure, List<Feature>>> getFeaturesOfSpecificGym(String gymId) {
    return executeTryAndCatchForRepository(() async {
      final response= await dataSource.getFeatureOfSpecificGym(gymId);
      return response.map((e) => Feature.fromMap(e)).toList();
    });
  }
  
  @override
  Future<Either<Faliure, void>> addGymPlan(String gymId, Plan plan) {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.addGymPlan(gymId, plan); 
    });
  }
}
