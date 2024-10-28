import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/features/sports_service_providers/data/data_source/service_providers_remote_data_source.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';
import 'dart:async';

abstract class ServiceProvidersRepository {
  Future<Either<Faliure, void>> addServiceToFirestore(
      PlaygroundRequestModel playground);
  Future<Either<Faliure, List<String>>> addFImagesToStorage(List<File> images);
  Future<Either<Faliure, bool>> deleteImagesFromStorage(List<File> images);
}

@Injectable(as: ServiceProvidersRepository)
class ServiceProvidersRepositoryImpl implements ServiceProvidersRepository {
  ServiceProvidersRemoteDataSource dataSource;
  ServiceProvidersRepositoryImpl({required this.dataSource});
  //TODO:Check connectivity  in executeTryAndCatchForRepository /* done
  @override
  Future<Either<Faliure, void>> addServiceToFirestore(
      PlaygroundRequestModel playground) {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.addServiceToFirestore(playground);
    });
  }

  @override
  Future<Either<Faliure, List<String>>> addFImagesToStorage(
      List<File> images) async {
    return executeTryAndCatchForRepository(() async {
      return dataSource.addImagesToStorage(images);
    });
  }

  @override
  Future<Either<Faliure, bool>> deleteImagesFromStorage(
      List<File> images) async {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.deleteImagesFromStorage(images);
    });
  }
}
