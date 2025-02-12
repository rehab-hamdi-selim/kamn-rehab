import 'package:kamn/features/sports/data/models/reservation_model.dart';

enum PickTimeForReservationStatus {
  initial,
  loading,
  success,
  failure,
  failureUpdate,
  intervalSelected,
  availabledTimeUpdated,
  reservationDeleted,
  reservationLoaded,
  allowCountuine
}

extension PickTimeForReservationStateExtension on PickTimeForReservationState {
  bool get isInitial => state == PickTimeForReservationStatus.initial;
  bool get isLoading => state == PickTimeForReservationStatus.loading;
  bool get isSuccess => state == PickTimeForReservationStatus.success;
  bool get isFailure => state == PickTimeForReservationStatus.failure;
  bool get isReservationDelete =>
      state == PickTimeForReservationStatus.reservationDeleted;
  bool get isReservationLoaded =>
      state == PickTimeForReservationStatus.reservationLoaded;
  bool get isFailureUpdate =>
      state == PickTimeForReservationStatus.failureUpdate;
  bool get isAvailabledTimeUpdated =>
      state == PickTimeForReservationStatus.availabledTimeUpdated;
  bool get isIntervalSelected =>
      state == PickTimeForReservationStatus.intervalSelected;
      bool get isAllowCountuine => state== PickTimeForReservationStatus.allowCountuine;
}

class PickTimeForReservationState {
  final PickTimeForReservationStatus state;
  final String? erorrMessage;
  final DateTime? selectedDate;
  final ReservationModel? reservation;
  final List<ReservationModel>? reservationList;
  final bool contuine;

  PickTimeForReservationState(
      {required this.state,
      this.erorrMessage,
      this.selectedDate,
      this.reservation,
      this.reservationList,this.contuine=false});

  PickTimeForReservationState copyWith(
      {PickTimeForReservationStatus? state,
      String? erorrMessage,
      DateTime? selectedDate,
      ReservationModel? reservation,
      bool? contuine,
      List<ReservationModel>? reservationList}) {
    return PickTimeForReservationState(
      state: state ?? this.state,
      contuine: contuine??this.contuine,
      erorrMessage: erorrMessage ?? this.erorrMessage,
      selectedDate: selectedDate ?? this.selectedDate,
      reservation: reservation ?? this.reservation,
      reservationList: reservationList ?? this.reservationList,
    );
  }
}
