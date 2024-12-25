import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';
import 'package:kamn/features/sports_service_providers/data/repository/service_providers_repository.dart';

@injectable
class FilterSearchDataUseCase {
  ServiceProvidersRepository repository;
  FilterSearchDataUseCase({required this.repository});

  Future<Either<Faliure, Map<String, List<PlaygroundRequestModel>>?>> invoke(
      String query, String type) async {
    var result = await repository.searchByQuery(query, type);

    return result.fold(
      (error) => Left(error),
      (success) {
        if (success == null || success[type] == null) {
          return const Right(null);
        }

        var filteredData = success[type]!.where((playground) {
          return playground.type == type;
        }).toList();

        return Right({type: filteredData});
      },
    );
  }
}
