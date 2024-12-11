import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_state.dart';

import '../../../data/repositories/sports_repository.dart';
import '../../../data/models/playground_model.dart';

@injectable
class SportsGroundsCubit extends Cubit<SportsGroundsState> {
  final SportsRepository _sportsRepository;
  SportsGroundsCubit({required SportsRepository sportsRepository})
      : _sportsRepository = sportsRepository,
        super(SportsGroundsState(state: SportsGroundsStatus.initial));

  Future<void> getPlaygrounds() async {
    emit(state.copyWith(state: SportsGroundsStatus.loading));
    final result = await _sportsRepository.getPlaygrounds();
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

  Future<void> searchByQuery(String query) async {
    emit(state.copyWith(state: SportsGroundsStatus.loading));

    final result = await _sportsRepository.searchByQuery(query);
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
}
