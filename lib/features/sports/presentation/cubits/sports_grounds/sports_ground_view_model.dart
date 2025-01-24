import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/features/sports/data/models/filter_model.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider_grounds/service_provider_grounds_view_model.dart';

@injectable
class SportsGroundViewModel {
  TextEditingController? searchController;
  TextEditingController? loactionController;
  TextEditingController? maxPriceController;
  TextEditingController? minPriceController;
  var distance = 0.0;
  var userLatitude = 0.0;
  var userLongitude = 0.0;
  List<FilterModel?> filterItem = [];

  List<PlaygroundModel> playgroundsByCategory = [];

  SportsGroundViewModel() {
    initControllers();
  }

  void initControllers() {
    searchController = TextEditingController();
    loactionController = TextEditingController();
    maxPriceController = TextEditingController();
    minPriceController = TextEditingController();
  }

  void resetViewModel() {
    distance = 0;
    loactionController?.clear();
    maxPriceController?.clear();
    minPriceController?.clear();
 }

  void dispose() {
    searchController = null;
    loactionController = null;
    maxPriceController = null;
    minPriceController = null;
    searchController?.dispose();
    loactionController?.dispose();
    maxPriceController?.dispose();
    minPriceController?.dispose();
  }

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
