import 'dart:isolate';
import 'dart:async';
import 'package:fpdart/fpdart.dart';
import 'package:kamn/core/helpers/geolocator_helper.dart';
import '../../../../core/erorr/faliure.dart';
import '../../data/models/playground_model.dart';
import '../../data/repositories/sports_repository.dart';

class SportsUsecase {
  final SportsRepository _sportsRepository;
  SportsUsecase(this._sportsRepository);
  Future<Either<Faliure, List<PlaygroundModel>?>> getPlaygrounds() =>
      _sportsRepository.getPlaygrounds();
  Future<Either<Faliure, List<PlaygroundModel>?>> getFiltersPlaygrounds({
    required int distance,
    required double? latitude,
    required double? longitude,
  }) async {
    var result = await _sportsRepository.getPlaygrounds();
    result.fold((l) => l, (r) {
      final ReceivePort receivePort = ReceivePort();
      Isolate.spawn(doFiltersPlaygrounds, {
        "receivePort": receivePort.sendPort,
        "distance": distance,
        "latitude": latitude,
        "longitude": longitude,
        "playgrounds": r as List<PlaygroundModel>
      });
      receivePort.listen((playgrounds) {
        result = playgrounds;
      });
      receivePort.close();
    });
    return result;
  }

  doFiltersPlaygrounds(Map<String, dynamic> params) {
    final SendPort sendPort = params["receivePort"];
    int distance = params["distance"];
    double? latitude = params["latitude"];
    double? longitude = params["longitude"];
    List<PlaygroundModel> playgrounds = params["playgrounds"];

    if (distance == 0) {
      sendPort.send(playgrounds);
    } else {
      if (latitude != null && longitude != null) {
        distance = distance * 1000;
        for (int i = 0; i < playgrounds.length; i++) {
          double distanceFromUser = GeolocatorHelper.distanceBetween(
              startLatitude: latitude,
              startLongitude: longitude,
              endLatitude: playgrounds[i].latitude,
              endLongitude: playgrounds[i].longitude);
          if (distanceFromUser > distance) playgrounds.removeAt(i);
        }
      }
      sendPort.send(playgrounds);
    }
  }
}
