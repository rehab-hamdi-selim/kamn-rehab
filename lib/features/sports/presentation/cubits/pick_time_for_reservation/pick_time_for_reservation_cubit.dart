import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/features/sports/data/models/reservation_model.dart';
import 'package:kamn/features/sports/data/repositories/sports_repository.dart';
import 'package:kamn/features/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_state.dart';

@injectable
class PickTimeForReservationCubit extends Cubit<PickTimeForReservationState> {
  PickTimeForReservationCubit({required this.repository})
      : super(PickTimeForReservationState(
            state: PickTimeForReservationStatus.initial));
  SportsRepository repository;
  List<String> selectedIntervals = [];

  void onIntervalSelection(String interval) {
    if (selectedIntervals.contains(interval)) {
      selectedIntervals.remove(interval);
    } else {
      selectedIntervals.add(interval);
    }
    emit(state.copyWith(state: PickTimeForReservationStatus.intervalSelected));
  }

  Future<void> onSubmitReservation(ReservationModel reservation) async {
    emit(state.copyWith(state: PickTimeForReservationStatus.loading));
    var response = await repository.submitReservation(reservation);
    response.fold((error) {
      emit(state.copyWith(
          state: PickTimeForReservationStatus.failure,
          erorrMessage: error.erorr));
    }, (success) {
      emit(state.copyWith(state: PickTimeForReservationStatus.success));
    });
  }

  Future<void> updateAvailableTimeForGround(
      String playgroundId, Map<String, dynamic> data) async {
    emit(state.copyWith(state: PickTimeForReservationStatus.loading));

    var response = await repository.updateState(playgroundId, data);
    response.fold((error) {
      emit(state.copyWith(
          state: PickTimeForReservationStatus.failure,
          erorrMessage: error.erorr));
    }, (success) {
      emit(state.copyWith(
          state: PickTimeForReservationStatus.availabledTimeUpdated));
    });
  }
}
