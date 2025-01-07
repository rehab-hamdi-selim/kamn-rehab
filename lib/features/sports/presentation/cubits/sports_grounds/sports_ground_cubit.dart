import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/utils/location.dart';
import 'package:kamn/features/sports/data/models/filter_model.dart';
import 'package:kamn/features/sports/domain/usecase/get_sports_from_firebase_usecase.dart';
import 'package:kamn/features/sports/domain/usecase/sports_ground_usecase.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_state.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_view_model.dart';
import '../../../../../core/const/constants.dart';
import '../../../data/repositories/sports_repository.dart';
import '../../../data/models/playground_model.dart';

@injectable
class SportsGroundsCubit extends Cubit<SportsGroundsState> {
  final SportsRepository sportsRepository;
  final SportsGroundUsecase sportsGroundUsecase;
  final GetSportsFromFirebaseUsecase getSportsFromFirebaseUsecase;
  final SportsGroundViewModel sportsGroundViewModel;
  SportsGroundsCubit(
      {required this.sportsRepository,
      required this.sportsGroundUsecase,
      required this.getSportsFromFirebaseUsecase,
      required this.sportsGroundViewModel})
      : super(SportsGroundsState(state: SportsGroundsStatus.initial));

  Future<void> getPlaygrounds() async {
    emit(state.copyWith(state: SportsGroundsStatus.loading));
    final result = await sportsRepository.getPlaygrounds();
    result.fold(
        (l) => emit(state.copyWith(
              state: SportsGroundsStatus.failure,
              erorrMessage: l.erorr,
            )), (r) {
      print(r.length);
      emit(state.copyWith(
        state: SportsGroundsStatus.success,
        playgrounds: r,
      ));
    });
  }

  Future<void> filterPlayGroundData(
      {num? maxPrice,
      num? minPrice,
      String? location,
      double? distance}) async {
    emit(SportsGroundsState(
      state: SportsGroundsStatus.loading,
    ));
    final result = await sportsGroundUsecase.filterGoundData(
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
    emit(state.copyWith(distance: value));
  }

  void deleteFilterItem({required int index}) {
    switch (sportsGroundViewModel.filterItem[index]!.icon) {
      case Icons.location_on_outlined:
        sportsGroundViewModel.loactionController?.clear();
        break;
      case Icons.monetization_on_outlined:
        sportsGroundViewModel.maxPriceController?.clear();
        sportsGroundViewModel.minPriceController?.clear();
        break;
      default:
        sportsGroundViewModel.distance = 0;
    }
    sportsGroundViewModel.filterItem
        .remove(sportsGroundViewModel.filterItem[index]);

    filterPlayGroundData(
      location: sportsGroundViewModel.loactionController?.text,
      maxPrice: sportsGroundViewModel.minPriceController?.text != ''
          ? int.parse(sportsGroundViewModel.maxPriceController?.text ?? '0')
          : null,
      distance: sportsGroundViewModel.distance,
      minPrice: sportsGroundViewModel.minPriceController?.text != ''
          ? int.parse(sportsGroundViewModel.minPriceController?.text ?? '0')
          : null,
    );
  }

  void resetFilter() {
    sportsGroundViewModel.resetViewModel();
    emit(state.copyWith(state: SportsGroundsStatus.initial));
  }

  void addFilterItem(
      {num? maxPrice, num? minPrice, String? location, double? distance}) {
    sportsGroundViewModel.filterItem = [
      if (location!.isNotEmpty)
        FilterModel(
          icon: Icons.location_on_outlined,
          title: location,
        ),
      if (maxPrice != null || minPrice != null)
        FilterModel(
          icon: Icons.monetization_on_outlined,
          title: '${minPrice ?? 0} - ${maxPrice ?? 'max'} LE',
        ),
      if (distance != null && distance != 0)
        FilterModel(
          icon: Icons.route_outlined,
          title: '${(sportsGroundViewModel.distance * 100).round()} Km away',
        ),
    ];
  }

  void getUserLocation() async {
    var response = await getLocationCoordinates();
    Map<String, double> data = {};
    response.fold((error) {}, (success) {
      data = success;
    });
    sportsGroundViewModel.userLatitude = data['latitude']!;
    sportsGroundViewModel.userLongitude = data['longitude']!;
  }

  @override
  Future<void> close() async {
    if (!isClosed) {
      sportsGroundViewModel.scrollController?.removeListener(initScrollListner);
      sportsGroundViewModel.dispose();
    }
    return super.close();
  }

  Future<void> searchByQuery(String query) async {
    emit(state.copyWith(state: SportsGroundsStatus.loading));

    final result = await sportsRepository.searchByQuery(query);
    result.fold((l) {
      emit(state.copyWith(
        state: SportsGroundsStatus.failure,
        erorrMessage: l.erorr,
      ));
    }, (r) {
      emit(state.copyWith(
        state: SportsGroundsStatus.success,
        playgrounds: r as List<PlaygroundModel>,
      ));
    });
  }

  void initScrollListner() {
    sportsGroundViewModel.scrollController?.addListener(() {
      if (sportsGroundViewModel
              .scrollController!.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!state.isScrolledDown &&
            sportsGroundViewModel.scrollController!.position.pixels >=
                Constants.kImageSliderHeight) {
          emit(state.copyWith(state: SportsGroundsStatus.isScrolledDown));
        }
      }

      if (sportsGroundViewModel.scrollController!.position.pixels <=
              kToolbarHeight + Constants.additionHightToToolBar &&
          sportsGroundViewModel.scrollController!.position.pixels != 0) {
        emit(state.copyWith(state: SportsGroundsStatus.isReturnedToTop));
      } else {
        if (state.isScrolledDown) {
          emit(state.copyWith(state: SportsGroundsStatus.isScrollingUp));
        }
      }
    });
  }
}
