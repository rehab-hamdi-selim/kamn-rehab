import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';
import 'package:kamn/features/sports/data/repositories/sports_repository.dart';

@injectable
class SportsGroundUsecase {
  final SportsRepository _sportsRepository;

  SportsGroundUsecase({required SportsRepository sportsRepository})
      : _sportsRepository = sportsRepository;

  Future<Either<Faliure, List<PlaygroundModel>>> filterGoundData(
      {num? maxPrice,
      num? minPrice,
      String? location,
      double? distance}) async {
    List<PlaygroundModel> fliterData = [];
    var result = await _sportsRepository.getPlaygrounds();
    return result.fold((error) => Left(error), (data) {
      for (var element in data!) {
        if (maxPrice != null && element.price! <= maxPrice) {
          fliterData.add(element);
        }
        if (minPrice != null && element.price! >= minPrice) {
          fliterData.add(element);
        }
        if (location != null && element.address!.compareTo(location) == 0) {
          fliterData.add(element);
        }
        // if (distance != null || distance != 0) {
        //   var distance = Geolocator.distanceBetween(
        //       element.latitude!, element.longitude!, endLatitude, endLongitude);
        // }
      }
      return Right(fliterData);
    });
  }
}
