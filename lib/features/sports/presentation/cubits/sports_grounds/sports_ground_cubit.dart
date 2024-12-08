import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/utils/location.dart';
import 'package:kamn/features/sports/data/models/filter_model.dart';
import 'package:kamn/features/sports/domain/usecase/sports_ground_usecase.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_state.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_view_model.dart';
import '../../../data/repositories/sports_repository.dart';
import '../../../data/models/playground_model.dart';

@injectable
class SportsGroundsCubit extends Cubit<SportsGroundsState> {
  final SportsRepository _sportsRepository;
  final SportsGroundUsecase _sportsGroundUsecase;
  SportsGroundsCubit(
      {required SportsRepository sportsRepository,
      required SportsGroundUsecase sportsGroundUsecase})
      : _sportsRepository = sportsRepository,
        _sportsGroundUsecase = sportsGroundUsecase,
        super(SportsGroundsState(state: SportsGroundsStatus.initial));

  static SportsGroundsCubit get(context) => BlocProvider.of(context);
  //init getPlaygrounds_from_firebase branch

  Future<void> getPlaygrounds() async {
    final result = await _sportsRepository.getPlaygrounds();
    result.fold(
        (l) => emit(SportsGroundsState(
              state: SportsGroundsStatus.failure,
              erorrMessage: l.erorr,
            )),
        (r) => emit(SportsGroundsState(
              state: SportsGroundsStatus.success,
              playgrounds: r as List<PlaygroundModel>,
            )));
  }

  Future<void> filterPlayGroundData(
      {num? maxPrice,
      num? minPrice,
      String? location,
      double? distance}) async {
    emit(SportsGroundsState(
      state: SportsGroundsStatus.loading,
    ));
    final result = await _sportsGroundUsecase.filterGoundData(
        distance: distance,
        location: location,
        maxPrice: maxPrice,
        minPrice: minPrice);
    result.fold((error) {
      emit(SportsGroundsState(
        state: SportsGroundsStatus.failure,
        erorrMessage: error.erorr,
      ));
    }, (success) {
      addFilterItem(
          distance: distance,
          location: location,
          maxPrice: maxPrice,
          minPrice: minPrice);
      emit(SportsGroundsState(
        state: SportsGroundsStatus.success,
        playgrounds: success,
      ));
    });
  }

  void changeDistance(double value) {
    emit(SportsGroundsState(
        state: SportsGroundsStatus
            .loading)); // Why Should Change State to do new state ?????
    SportsGroundViewModel.distance = value;
    emit(SportsGroundsState(
      state: SportsGroundsStatus.changeDistance,
    ));
  }

  void deleteFilterItem({required int index}) {
    switch (SportsGroundViewModel.filterData[index]!.icon) {
      case Icons.location_on_outlined:
        SportsGroundViewModel.loactionController.clear();
        break;
      case Icons.monetization_on_outlined:
        SportsGroundViewModel.maxPriceController.clear();
        SportsGroundViewModel.minPriceController.clear();
        break;
      default:
        SportsGroundViewModel.distance = 0;
    }
    SportsGroundViewModel.filterData
        .remove(SportsGroundViewModel.filterData[index]);

    filterPlayGroundData(
      location: SportsGroundViewModel.loactionController.text,
      maxPrice: SportsGroundViewModel.minPriceController.text != ''
          ? int.parse(SportsGroundViewModel.maxPriceController.text)
          : null,
      distance: SportsGroundViewModel.distance,
      minPrice: SportsGroundViewModel.minPriceController.text != ''
          ? int.parse(SportsGroundViewModel.minPriceController.text)
          : null,
    );
  }

  void addFilterItem(
      {num? maxPrice, num? minPrice, String? location, double? distance}) {
    SportsGroundViewModel.filterData = [
      if (location!.isNotEmpty)
        FilterModel(
          icon: Icons.location_on_outlined,
          title: location,
        ),
      if (maxPrice != null || minPrice != null)
        FilterModel(
          icon: Icons.monetization_on_outlined,
          title: '${minPrice ?? 0} - ${maxPrice ?? 0}',
        ),
      if (distance != null && distance != 0)
        FilterModel(
          icon: Icons.social_distance,
          title: '${(SportsGroundViewModel.distance * 100).round()}',
        ),
    ];
  }

  void getUserLocation() async {
    var response = await getLocationCoordinates();
    Map<String, double> data = {};
    response.fold((error) {}, (success) {
      data = success;
    });
    SportsGroundViewModel.userLatitude = data['latitude']!;
    SportsGroundViewModel.userLongitude = data['longitude']!;
  }
}
