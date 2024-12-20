// ignore_for_file: constant_identifier_names

import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:kamn/core/theme/app_pallete.dart';

@injectable
class ServiceProviderGroundsViewModel {
  List<SportDetail> teamSportList = [
    SportDetail(
      TeamSport.football.displayName,
      AppPallete.greenColor,
    ),
    SportDetail(
      TeamSport.basketball.displayName,
      AppPallete.pinkColor,
    ),
    SportDetail(
      TeamSport.tennis.displayName,
      AppPallete.orangeColor,
    ),
    SportDetail(
      TeamSport.volleyball.displayName,
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
  football,
  basketball,
  tennis,
  volleyball,
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

extension TeamSportExtension on TeamSport {
  String get displayName {
    switch (this) {
      case TeamSport.football:
        return "Football";
      case TeamSport.basketball:
        return "Basketball";
      case TeamSport.volleyball:
        return "Volleyball";
      case TeamSport.tennis:
        return "Tennis";
    }
  }
}
