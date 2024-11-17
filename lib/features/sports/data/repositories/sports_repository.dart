import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/features/sports/data/models/reservation_model.dart';
import '../../../../core/utils/try_and_catch.dart';
import '../data_source/sports_remote_data_source.dart';
import '../models/playground_model.dart';

abstract class SportsRepository {
  Future<Either<Faliure, List<PlaygroundModel>?>> getPlaygrounds();
  Future<Either<Faliure, void>> submitReservation(ReservationModel reservation);
  Future<Either<Faliure, void>> updateState(
      String playgroundId, Map<String, dynamic> data);
}

@Injectable(as: SportsRepository)
class SportsRepositoryImpl implements SportsRepository {
  final SportsRemoteDataSource _remoteDataSource;
  SportsRepositoryImpl({required SportsRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;
  @override
  Future<Either<Faliure, List<PlaygroundModel>?>> getPlaygrounds() async {
    return executeTryAndCatchForRepository(() async {
      final List<Map<String, dynamic>> rawData =
          await _remoteDataSource.getPlaygrounds();

      final playgrounds =
          rawData.map((data) => PlaygroundModel.fromMap(data)).toList();

      return playgrounds;
    });
  }

  @override
  Future<Either<Faliure, void>> submitReservation(
      ReservationModel reservation) {
    return executeTryAndCatchForRepository(() async {
      await _remoteDataSource.submitReservation(reservation);
    });
  }

  @override
  Future<Either<Faliure, void>> updateState(
      String playgroundId, Map<String, dynamic> data) {
    return executeTryAndCatchForRepository(() async {
      return await _remoteDataSource.updateState(playgroundId, data);
    });
  }
}
