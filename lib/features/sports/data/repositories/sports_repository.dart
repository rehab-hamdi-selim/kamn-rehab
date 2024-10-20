import 'package:fpdart/fpdart.dart';
import 'package:kamn/core/erorr/faliure.dart';

import '../../../../core/utils/try_and_catch.dart';
import '../../presentation/widgets/ground_details/custome_bottom_book.dart';
import '../data_source/sports_remote_data_source.dart';

class SportsRepository {
  final SportsRemoteDataSource _remoteDataSource;
  SportsRepository({required SportsRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;
  Future<Either<Faliure, List<PlaygroundModel>?>> getPlaygrounds() async {
    return executeTryAndCatchForRepository(() async {
      final List<Map<String, dynamic>> rawData =
          await _remoteDataSource.getPlaygrounds();

      final playgrounds =
          rawData.map((data) => PlaygroundModel.fromJson(data)).toList();

      return playgrounds;
    });
  }
}
