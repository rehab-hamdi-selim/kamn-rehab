import 'package:fpdart/fpdart.dart';
import 'package:kamn/core/erorr/faliure.dart';
import '../../../../core/utils/try_and_catch.dart';
import '../data_source/sports_remote_data_source.dart';
import '../models/playground_model.dart';
abstract interface class  SportsRepository {
  Future<Either<Faliure, List<PlaygroundModel>?>> getPlaygrounds();
}
class SportsRepositoryIpml implements SportsRepository {
  final SportsRemoteDataSource _remoteDataSource;
  SportsRepositoryIpml({required SportsRemoteDataSource remoteDataSource})
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
