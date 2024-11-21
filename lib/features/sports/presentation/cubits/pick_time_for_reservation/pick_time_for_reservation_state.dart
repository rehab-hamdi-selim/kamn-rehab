import 'package:kamn/features/sports/data/models/reservation_model.dart';

enum PickTimeForReservationStatus {
  initial,
  loading,
  success,
  failure,
  failureUpdate,
  intervalSelected,
  availabledTimeUpdated
}

extension PickTimeForReservationStateExtension on PickTimeForReservationState {
  bool get isInitial => state == PickTimeForReservationStatus.initial;
  bool get isLoading => state == PickTimeForReservationStatus.loading;
  bool get isSuccess => state == PickTimeForReservationStatus.success;
  bool get isFailure => state == PickTimeForReservationStatus.failure;
  bool get isFailureUpdate =>
      state == PickTimeForReservationStatus.failureUpdate;
  bool get isAvailabledTimeUpdated =>
      state == PickTimeForReservationStatus.availabledTimeUpdated;
  bool get isIntervalSelected =>
      state == PickTimeForReservationStatus.intervalSelected;
}

class PickTimeForReservationState {
  final PickTimeForReservationStatus state;
  final String? erorrMessage;
  final DateTime? selectedDate;
  final ReservationModel? reservation;

  PickTimeForReservationState(
      {required this.state,
      this.erorrMessage,
      this.selectedDate,
      this.reservation});

  PickTimeForReservationState copyWith(
      {PickTimeForReservationStatus? state,
      String? erorrMessage,
      DateTime? selectedDate,
      ReservationModel? reservation}) {
    return PickTimeForReservationState(
      state: state ?? this.state,
      erorrMessage: erorrMessage ?? this.erorrMessage,
      selectedDate: selectedDate ?? this.selectedDate,
      reservation: reservation ?? this.reservation,
    );
  }
}
