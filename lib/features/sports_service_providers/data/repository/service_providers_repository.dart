import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';
import 'package:kamn/features/sports/data/models/reservation_model.dart';
import 'package:kamn/features/sports_service_providers/data/data_source/service_providers_remote_data_source.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';
import 'dart:async';


abstract class ServiceProvidersRepository {
  Future<Either<Faliure, PlaygroundRequestModel>> addServiceToFirestore(
      PlaygroundRequestModel playground);

  Future<Either<Faliure, List<String>>> addImagesToStorage(List<File> images);

  Future<Either<Faliure, bool>> deleteImagesFromStorage(List<String> images);

  Future<Either<Faliure, List<PlaygroundRequestModel>>>
      getPlaygroundsRequests();
  Future<Either<Faliure, List<PlaygroundModel>>> getPlaygroundsByOwnerId(
      String ownerId);
  Future<Either<Faliure, List<ReservationModel>>>
      getPlaygroundsReservationDetailsById(String playgroundId);
  Future<Either<Faliure, void>> addWithTransactionToFirebase(
      PlaygroundRequestModel playground);
  Future<Either<Faliure, void>> updateState(
      PlaygroundRequestModel playground, Map<String, dynamic> data);
  Future<Either<Faliure, Map<String, List<PlaygroundRequestModel>>?>>
      searchByQuery(String query, String type);
  Future<Either<Faliure,List<ReservationModel>?>> getCurrentOrdersByCategory(
      String category,String userId);
  Future<Either<Faliure,List<ReservationModel>?>> getFinishedOrdersByCategory(
      String category,String userId);
}

@Injectable(as: ServiceProvidersRepository)
class ServiceProvidersRepositoryImpl implements ServiceProvidersRepository {
  ServiceProvidersRemoteDataSource dataSource;
  ServiceProvidersRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Faliure, PlaygroundRequestModel>> addServiceToFirestore(
      PlaygroundRequestModel playground) {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.addServiceToFirestore(playground);
    });
  }

  @override
  Future<Either<Faliure, List<String>>> addImagesToStorage(
      List<File> images) async {
    return executeTryAndCatchForRepository(() async {
      return dataSource.addImagesToStorage(images);
    });
  }

  @override
  Future<Either<Faliure, bool>> deleteImagesFromStorage(
      List<String> images) async {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.deleteImagesFromStorage(images);
    });
  }

  @override
  Future<Either<Faliure, List<PlaygroundRequestModel>>>
      getPlaygroundsRequests() {
    return executeTryAndCatchForRepository(() async {
      var data = await dataSource.getPlaygroundsRequests();
      return data.map((value) {
        return PlaygroundRequestModel.fromMap(value);
      }).toList();
    });
  }

  @override
  Future<Either<Faliure, List<PlaygroundModel>>> getPlaygroundsByOwnerId(
      String ownerId) {
    return executeTryAndCatchForRepository(() async {
      var data = await dataSource.getPlaygroundsByOwnerId(ownerId);
      return data.map((value) {
        return PlaygroundModel.fromMap(value);
      }).toList();
    });
  }

  @override
  Future<Either<Faliure, void>> addWithTransactionToFirebase(
      PlaygroundRequestModel playground) {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.addWithTransactionToFirebase(playground);
    });
  }

  @override
  Future<Either<Faliure, void>> updateState(
      PlaygroundRequestModel playground, Map<String, dynamic> data) {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.updateState(playground, data);
    });
  }

  @override
  Future<Either<Faliure, List<ReservationModel>>>
      getPlaygroundsReservationDetailsById(String playgroundId) {
    return executeTryAndCatchForRepository(() async {
      var data =
          await dataSource.getPlaygroundsReservationDetailsById(playgroundId);

      return data.map((value) {
        return ReservationModel.fromMap(value);
      }).toList();
    });
  }

  @override
  Future<Either<Faliure, Map<String, List<PlaygroundRequestModel>>?>>
      searchByQuery(String query, String type) {
    return executeTryAndCatchForRepository(() async {
      final List<Map<String, dynamic>> rawData =
          await dataSource.searchByQuery(query, type);

      final playgrounds =
          rawData.map((data) => PlaygroundRequestModel.fromMap(data)).toList();

      return {type: playgrounds};
    });
  }
  
  @override
  Future<Either<Faliure,List<ReservationModel>?>> getCurrentOrdersByCategory(String category,String userId) {
    return executeTryAndCatchForRepository(() async {
     var response= await dataSource.getCurrentOrdersByCategory(category,userId);
       return response?.map((value) {
        return ReservationModel.fromMap(value);
      }).toList();
    });
  }
  
  @override
  Future<Either<Faliure,List<ReservationModel>?>> getFinishedOrdersByCategory(String category,String userId) {
       return executeTryAndCatchForRepository(() async {
     var response= await dataSource.getFinishedOrdersByCategory(category,userId);
       return response?.map((value) {
        return ReservationModel.fromMap(value);
      }).toList();
    });
  }
}
