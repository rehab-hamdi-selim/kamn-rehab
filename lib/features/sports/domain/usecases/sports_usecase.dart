import 'dart:isolate';
import 'dart:async';
import 'package:fpdart/fpdart.dart';
import 'package:kamn/core/helpers/geolocator_helper.dart';
import '../../../../core/erorr/faliure.dart';
import '../../data/models/playground_model.dart';
import '../../data/repositories/sports_repository.dart';

class SportsUsecase {
  final SportsRepository sportsRepository;
  final GeolocatorHelper
      geolocatorHelper; // Added as dependency for easy mocking

  SportsUsecase(
      {required this.sportsRepository, required this.geolocatorHelper});

  Future<Either<Faliure, List<PlaygroundModel>?>> getPlaygrounds() =>
      sportsRepository.getPlaygrounds();

  Future<Either<Faliure, List<PlaygroundModel>?>> getFiltersPlaygrounds({
    required int distance,
    required double? latitude,
    required double? longitude,
  }) async {
    var result = await sportsRepository.getPlaygrounds();
    return await result.fold(
      (failure) => Left(failure),
      (playgrounds) async {
        if (playgrounds == null || latitude == null || longitude == null) {
          return Right(playgrounds);
        }

        final filteredPlaygrounds = await _filterPlaygroundsInIsolate(
            distance, latitude, longitude, playgrounds);

        return Right(filteredPlaygrounds);
      },
    );
  }

  Future<List<PlaygroundModel>> _filterPlaygroundsInIsolate(
      int distance,
      double latitude,
      double longitude,
      List<PlaygroundModel> playgrounds) async {
    final receivePort = ReceivePort();

    await Isolate.spawn(_doFiltersPlaygrounds, {
      "receivePort": receivePort.sendPort,
      "distance": distance,
      "latitude": latitude,
      "longitude": longitude,
      "playgrounds": playgrounds,
      "geolocatorHelper": geolocatorHelper, // Pass the helper as a dependency
    });

    final filteredPlaygrounds =
        await receivePort.first as List<PlaygroundModel>;
    receivePort.close();
    return filteredPlaygrounds;
  }

  static void _doFiltersPlaygrounds(Map<String, dynamic> params) {
    final SendPort sendPort = params["receivePort"];
    final GeolocatorHelper geolocatorHelper = params["geolocatorHelper"];
    int distance = params["distance"] * 1000;
    double latitude = params["latitude"];
    double longitude = params["longitude"];
    List<PlaygroundModel> playgrounds = params["playgrounds"];

    playgrounds = playgrounds.where((playground) {
      final double distanceFromUser = geolocatorHelper.distanceBetween(
        startLatitude: latitude,
        startLongitude: longitude,
        endLatitude: playground.latitude,
        endLongitude: playground.longitude,
      );
      return distanceFromUser <= distance;
    }).toList();

    sendPort.send(playgrounds);
  }
}

//first we will make a bloc to get the user current location 
//secound we will make a requset to get the playground 
//third we will make a function to filter the playgrounds based on the distance

//each one had its own bloc and use case if ites needed
