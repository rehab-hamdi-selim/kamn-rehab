// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  @override
  String toString() {
    return 'TrackGroundsReservationDetailsState(state: $state, playgroundsReservationDetails: $playgroundsReservationDetails, erorrMessage: $erorrMessage, successMessage: $successMessage)';
  }
}
