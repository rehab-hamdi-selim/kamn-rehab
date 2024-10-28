import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/features/sports_service_providers/data/data_source/service_provider_grounds_data_source.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';

abstract class ServiceProviderGroundsRepository {
  Future<Either<Faliure, List<PlaygroundRequestModel>>>
      getPlaygroundsRequests();
}

@Injectable(as: ServiceProviderGroundsRepository)
class ServiceProviderGroundsRepositoryImpl
    implements ServiceProviderGroundsRepository {
  ServiceProviderGroundsDataSource dataSource;
  ServiceProviderGroundsRepositoryImpl({required this.dataSource});
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
}
