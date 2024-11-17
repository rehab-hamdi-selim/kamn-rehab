enum PickTimeForReservationStatus {
  initial,
  loading,
  success,
  failure,
  intervalSelected,
  availabledTimeUpdated
}

extension PickTimeForReservationStateExtension on PickTimeForReservationState {
  bool get isInitial => state == PickTimeForReservationStatus.initial;
  bool get isLoading => state == PickTimeForReservationStatus.loading;
  bool get isSuccess => state == PickTimeForReservationStatus.success;
  bool get isFailure => state == PickTimeForReservationStatus.failure;
  bool get isAvailabledTimeUpdated =>
      state == PickTimeForReservationStatus.availabledTimeUpdated;
  bool get isIntervalSelected =>
      state == PickTimeForReservationStatus.intervalSelected;
}

class PickTimeForReservationState {
  final PickTimeForReservationStatus state;
  final String? erorrMessage;

  PickTimeForReservationState({required this.state, this.erorrMessage});

  PickTimeForReservationState copyWith({
    PickTimeForReservationStatus? state,
    String? erorrMessage,
  }) {
    return PickTimeForReservationState(
      state: state ?? this.state,
      erorrMessage: erorrMessage ?? this.erorrMessage,
    );
  }
}
