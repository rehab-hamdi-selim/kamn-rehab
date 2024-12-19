import 'package:kamn/features/sports/data/models/playground_model.dart';

enum ViewReservationStatus { intial, loading, success, failure }

extension ViewReservationExtension on ViewReservationState {
  bool get inIntial => state == ViewReservationStatus.intial;
  bool get inSuccess => state == ViewReservationStatus.success;
  bool get inLoading => state == ViewReservationStatus.loading;
  bool get inFailure => state == ViewReservationStatus.failure;
}

class ViewReservationState {
  final ViewReservationStatus state;
  final List<PlaygroundModel>? reservation;
  final String? error;

  ViewReservationState({required this.state, this.reservation, this.error});
}
