// ignore_for_file: constant_identifier_names

import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:kamn/core/theme/app_pallete.dart';

@injectable
class ServiceProviderGroundsViewModel {
  List<SportDetail> teamSportList = [
    SportDetail(
      TeamSport.Football.name,
      AppPallete.greenColor,
    ),
    SportDetail(
      TeamSport.Basketball.name,
      AppPallete.pinkColor,
    ),
    SportDetail(
      TeamSport.Tennis.name,
      AppPallete.orangeColor,
    ),
    SportDetail(
      TeamSport.Volleyball.name,
      AppPallete.yellowColor,
    ),
  ];
  List<SportDetail> individualSportList = [
    SportDetail(
      IndividualSport.skyDiving.displayName,
      AppPallete.voiletteColor,
    ),
    SportDetail(
      IndividualSport.swimming.displayName,
      AppPallete.lightBlueColor,
    ),
  ];
}

enum TeamSport {
  Football,
  Basketball,
  Tennis,
  Volleyball,
}

class SportDetail {
  final String title;
  final Color color;

  SportDetail(this.title, this.color);
}

enum IndividualSport {
  skyDiving,
  swimming,
}

extension IndividualSportExtension on IndividualSport {
  String get displayName {
    switch (this) {
      case IndividualSport.skyDiving:
        return "Sky Diving";
      case IndividualSport.swimming:
        return "Swimming";
    }
  }
}
