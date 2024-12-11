import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';
import 'package:kamn/features/sports_service_providers/data/repository/service_providers_repository.dart';
import 'package:collection/collection.dart';

@injectable
class GetServicesFromFirebaseUsecase {
  ServiceProvidersRepository repository;
  GetServicesFromFirebaseUsecase({required this.repository});

  Future<Either<Faliure, Map<String, List<PlaygroundRequestModel>>>>
      invoke() async {
    var response = await repository.getPlaygroundsRequests();
    return response.fold(
      (error) => Left(error),
      (success) {
        final filtteredData = groupBy(
          success,
          (PlaygroundRequestModel playground) => playground.type ?? 'null',
        );
        return Right(filtteredData);
      },
    );
  }
}
