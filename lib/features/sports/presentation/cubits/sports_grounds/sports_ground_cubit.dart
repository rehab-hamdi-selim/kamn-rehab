import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
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
// TODO Calculate Disy=tance to show it
  // Future<double> claculateDistance({
  //   double? goundLatitude,
  //   double? groundLongitude,
  // }) async {
  //   var userLocation = await getUserLocation();
  //   return Geolocator.distanceBetween(goundLatitude!, groundLongitude!,
  //           userLocation['latitude']!, userLocation['longitude']!) /
  //       1000;
  // }
}
