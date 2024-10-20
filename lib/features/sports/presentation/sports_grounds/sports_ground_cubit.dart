import 'package:bloc/bloc.dart';
import 'package:kamn/features/sports/presentation/sports_grounds/sports_ground_state.dart';

import '../../data/repositories/sports_repository.dart';
import '../../data/models/playground_model.dart';

class SportsGroundsCubit extends Cubit<SportsGroundsState> {
  final SportsRepository _sportsRepository;
  SportsGroundsCubit({required SportsRepository sportsRepository})
      : _sportsRepository = sportsRepository,
        super(SportsGroundsState(state: SportsGroundsStatus.initial));

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
      )),
    );
  }
}
