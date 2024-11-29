import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:kamn/features/sports/data/models/reservation_model.dart';
import 'package:kamn/features/sports/data/repositories/sports_repository.dart';
import 'package:kamn/features/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_state.dart';

@injectable
class PickTimeForReservationCubit extends Cubit<PickTimeForReservationState> {
  PickTimeForReservationCubit({required this.repository})
      : super(PickTimeForReservationState(
            state: PickTimeForReservationStatus.initial)) {
    getAllReservation();
  }
  SportsRepository repository;
  List<String> selectedIntervals = [];
  Map<String, dynamic> updates = {};

  void onIntervalSelection(String interval) {
    if (selectedIntervals.contains(interval)) {
      selectedIntervals.remove(interval);
      updates.remove(
          'available_time.${DateFormat.E().format(state.selectedDate ?? DateTime.now())}.$interval');
    } else {
      selectedIntervals.add(interval);
      updates['available_time.${DateFormat.E().format(state.selectedDate ?? DateTime.now())}.$interval'] =
          'selected';
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
      emit(state.copyWith(
          state: PickTimeForReservationStatus.success, reservation: success));
    });
  }

  Future<void> updateAvailableTimeForGround(
      String playgroundId, Map<String, dynamic> data) async {
    emit(state.copyWith(state: PickTimeForReservationStatus.loading));

    var response = await repository.updateState(playgroundId, data);
    response.fold((error) {
      emit(state.copyWith(
          state: PickTimeForReservationStatus.failureUpdate,
          erorrMessage: error.erorr));
    }, (success) {
      emit(state.copyWith(
          state: PickTimeForReservationStatus.availabledTimeUpdated));
    });
  }

  Future<void> deleteReservation(ReservationModel reservation) async {
    var response = await repository.delete(reservation);
    response.fold((error) {
      emit(state.copyWith(
          state: PickTimeForReservationStatus.failure,
          erorrMessage: error.erorr));
    }, (success) {
      emit(state.copyWith(
          state: PickTimeForReservationStatus.reservationDeleted));
    });
  }

  void onDaySelected(DateTime newDay) {
    emit(state.copyWith(
        state: PickTimeForReservationStatus.loading, selectedDate: newDay));
  }

  Future<void> getAllReservation() async {
    var response = await repository.getAllReservation();
    response.fold((error) {
      print(error.erorr);
      emit(state.copyWith(
          state: PickTimeForReservationStatus.failure,
          erorrMessage: error.erorr));
    }, (success) {
      print(success);
      emit(state.copyWith(
          state: PickTimeForReservationStatus.reservationLoaded,
          reservationList: success));
    });
  }
}
