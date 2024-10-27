import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:kamn/core/erorr/faliure.dart';
import '../../../../core/utils/try_and_catch.dart';
import '../data_source/sports_remote_data_source.dart';
import '../models/playground_model.dart';

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

  Future<Either<Faliure, Map<String, dynamic>>>
      getPlaygroundsWithFirstPagginationWay(int limit) async {
    return executeTryAndCatchForRepository(() async {
      final Map<String, dynamic> rawData =
          await _remoteDataSource.getPlaygroundsWithFirstPagginationWay(limit);

      final playgrounds = (rawData["data"] as List<Map<String, dynamic>>)
          .map((data) => PlaygroundModel.fromMap(data))
          .toList();

      return {
        "playgrounds": playgrounds,
        "hasReachedEnd": rawData["hasReachedEnd"]
      };
    });
  }

  Future<Either<Faliure, List<PlaygroundModel>?>>
      getPlaygroundsWithSecoundPagginationWay(
          DocumentSnapshot? lastVisible) async {
    return executeTryAndCatchForRepository(() async {
      final List<Map<String, dynamic>> rawData = await _remoteDataSource
          .getPlaygroundsWithSecoundPagginationWay(lastVisible);

      final playgrounds =
          rawData.map((data) => PlaygroundModel.fromMap(data)).toList();

      return playgrounds;
    });
  }

  Future<Either<Faliure, List<PlaygroundModel>?>>
      getPlaygroundsWithThirdPagginationWay(int startAt) async {
    return executeTryAndCatchForRepository(() async {
      final List<Map<String, dynamic>> rawData = await _remoteDataSource
          .getPlaygroundsWithThirdPagginationWay(startAt);

      final playgrounds =
          rawData.map((data) => PlaygroundModel.fromMap(data)).toList();

      return playgrounds;
    });
  }
}
