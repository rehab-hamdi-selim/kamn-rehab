import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import '../../../../core/utils/try_and_catch.dart';
import '../data_source/sports_remote_data_source.dart';
import '../models/playground_model.dart';

@injectable
class SportsRepository {
  final SportsRemoteDataSource _remoteDataSource;
  SportsRepository({required SportsRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;
  Future<Either<Faliure, List<PlaygroundModel>?>> getPlaygrounds() async {
    return executeTryAndCatchForRepository(() async {
      final List<Map<String, dynamic>> rawData =
          await _remoteDataSource.getPlaygrounds();

      final playgrounds =
          rawData.map((data) => PlaygroundModel.fromMap(data)).toList();

      return playgrounds;
    });
  }
}
