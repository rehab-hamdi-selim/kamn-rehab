import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';

import '../../../../core/utils/try_and_catch.dart';
import '../data_source/sports_remote_data_source.dart';

class SportsRepository {
  final SportsRemoteDataSource _remoteDataSource;
  SportsRepository({required SportsRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;
  Future<Either<Faliure, List<PlaygroundModel>?>> getPlaygrounds() async {
    return executeTryAndCatchForRepository(() async {
      final List<Map<String, dynamic>> rawData =
          await _remoteDataSource.getPlaygrounds();

      final playgrounds = rawData
          .map((data) => PlaygroundModel.fromJson(jsonEncode(data)))
          .toList();

      return playgrounds;
    });
  }
}
