import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_state.dart';
import '../../../data/models/playground_model.dart';
import '../../../domain/usecases/sports_usecase.dart';

class SportsGroundsCubit extends Cubit<SportsGroundsState> {
  final SportsUsecase _sportsUsecase;
  SportsGroundsCubit({required SportsUsecase sportsUsecase})
      : _sportsUsecase = sportsUsecase,
        super(SportsGroundsState(state: SportsGroundsStatus.initial));

  //don't ever but context in the cubit
  //static SportsGroundsCubit get(context) => BlocProvider.of(context);

  //init getPlaygrounds_from_firebase branch

  Future<void> getPlaygrounds() async {
    emit(SportsGroundsState(state: SportsGroundsStatus.loading));
    final result = await _sportsUsecase.getPlaygrounds();
    result.fold(
        (l) => emit(state.copyWith(
              state: SportsGroundsStatus.failure,
              erorrMessage: l.erorr,
            )),
        (r) => emit(state.copyWith(
              state: SportsGroundsStatus.success,
              playgrounds: r as List<PlaygroundModel>,
            )));
  }

  int distanceCubit = 0;
  applyFilter({
    distance,
    double? latitude,
    double? longitude,
  }) async {
    distanceCubit = distance;
    emit(SportsGroundsState(state: SportsGroundsStatus.loading));
    final result = await _sportsUsecase.getFiltersPlaygrounds(
      distance: distance,
      latitude: latitude,
      longitude: longitude,
    );
    result.fold(
        (l) => emit(state.copyWith(
              state: SportsGroundsStatus.failure,
              erorrMessage: l.erorr,
            )),
        (r) => emit(state.copyWith(
              state: SportsGroundsStatus.filtter,
              playgrounds: r as List<PlaygroundModel>,
            )));
    emit(state.copyWith(
      state: SportsGroundsStatus.filtter,
    ));
  }

  void changeLocationFilter(double distance) {
    emit(state.copyWith(
      distanceFilterValue: distance,
    ));
  }
}
