import 'package:kamn/features/sports/data/models/reservation_model.dart';

enum TrackGroundsReservationDetailsStatus {
  initial,
  loading,
  success,
  failure,
}

extension TrackGroundsStateExtension on TrackGroundsReservationDetailsState {
  bool get isInitial => state == TrackGroundsReservationDetailsStatus.initial;
  bool get isLoading => state == TrackGroundsReservationDetailsStatus.loading;
  bool get isSuccess => state == TrackGroundsReservationDetailsStatus.success;
  bool get isFailure => state == TrackGroundsReservationDetailsStatus.failure;
}

class TrackGroundsReservationDetailsState {
  final TrackGroundsReservationDetailsStatus state;
  final List<ReservationModel>? playgroundsReservationDetails;
  final String? erorrMessage;
  final String? successMessage;

  TrackGroundsReservationDetailsState({
    required this.state,
    this.playgroundsReservationDetails,
    this.erorrMessage,
    this.successMessage,
  });
  TrackGroundsReservationDetailsState copyWith({
    TrackGroundsReservationDetailsStatus? state,
    List<ReservationModel>? playgroundsReservationDetails,
    String? erorrMessage,
    String? successMessage,
  }) {
    return TrackGroundsReservationDetailsState(
      state: state ?? this.state,
      playgroundsReservationDetails:
          playgroundsReservationDetails ?? this.playgroundsReservationDetails,
      erorrMessage: erorrMessage ?? this.erorrMessage,
      successMessage: successMessage ?? this.successMessage,
    );
  }
}
