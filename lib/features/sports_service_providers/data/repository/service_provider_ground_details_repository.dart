import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';
import 'package:kamn/features/sports_service_providers/data/data_source/service_provider_ground_details_data_source.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';

abstract class ServiceProviderGroundDetailsRepository {
  Future<Either<Faliure, void>> addToFirebase(PlaygroundModel playground);
  Future<Either<Faliure, void>> updateState(
      PlaygroundRequestModel playground, Map<String, dynamic> data);
}

@Injectable(as: ServiceProviderGroundDetailsRepository)
class ServiceProviderGroundDetailsRepositoryImpl
    implements ServiceProviderGroundDetailsRepository {
  ServiceProviderGroundDetailsDataSource dataSource;
  ServiceProviderGroundDetailsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Faliure, void>> addToFirebase(PlaygroundModel playground) {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.addToFiresore(playground);
    });
  }

  @override
  Future<Either<Faliure, void>> updateState(
      PlaygroundRequestModel playground, Map<String, dynamic> data) {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.updateState(playground, data);
    });
  }
}
