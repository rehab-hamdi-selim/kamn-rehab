// ignore_for_file: constant_identifier_names


import 'package:injectable/injectable.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider_grounds/service_provider_grounds_view_model.dart';

@injectable
class AddServiceProviderViewModel {
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
