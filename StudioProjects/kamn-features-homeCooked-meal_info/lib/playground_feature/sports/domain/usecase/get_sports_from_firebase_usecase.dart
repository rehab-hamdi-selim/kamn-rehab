import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/playground_feature/sports/data/models/playground_model.dart';
import 'package:kamn/playground_feature/sports/data/repositories/sports_repository.dart';
import 'package:collection/collection.dart';

@injectable
class GetPlaygroundsAndFlittered {
  SportsRepository repository;
  GetPlaygroundsAndFlittered({required this.repository});

  Future<Either<Faliure, Map<String, List<PlaygroundModel>>>> invoke() async {
    var response = await repository.getPlaygrounds();
    return response.fold(
      (error) => Left(error),
      (success) {
        final filtteredData = groupBy(
          success,
          (PlaygroundModel playground) => playground.type ?? 'null',
        );
        return Right(filtteredData);
      },
    );
  }
}
