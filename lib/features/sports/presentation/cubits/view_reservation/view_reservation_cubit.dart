import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/features/sports/data/repositories/sports_repository.dart';
import 'package:kamn/features/sports/presentation/cubits/view_reservation/view_reservation_state.dart';

@injectable
class ViewReservationCubit extends Cubit<ViewReservationState> {
  final SportsRepository _sportsRepository;
  ViewReservationCubit({required SportsRepository sportsRepository})
      : _sportsRepository = sportsRepository,
        super(ViewReservationState(state: ViewReservationStatus.intial));

  void getResevation() async {
    emit(ViewReservationState(
      state: ViewReservationStatus.loading,
    ));
    var result = await _sportsRepository.getPlaygrounds();
    result.fold((error) {
      emit(ViewReservationState(
          state: ViewReservationStatus.failure, error: error.erorr));
    }, (success) {
      emit(ViewReservationState(
          state: ViewReservationStatus.success, reservation: success));
    });
  }
}
