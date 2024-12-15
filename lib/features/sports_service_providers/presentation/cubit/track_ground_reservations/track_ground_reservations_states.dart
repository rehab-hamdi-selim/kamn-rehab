import 'package:kamn/features/sports/data/models/playground_model.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';

enum TrackGroundsStatus {
  initial,
  loading,
  success,
  failure,
}

extension TrackGroundsStateExtension on TrackGroundsState {
  bool get isInitial => state == TrackGroundsStatus.initial;
  bool get isLoading => state == TrackGroundsStatus.loading;
  bool get isSuccess => state == TrackGroundsStatus.success;
  bool get isFailure => state == TrackGroundsStatus.failure;
}

class TrackGroundsState {
  final TrackGroundsStatus state;
  final List<PlaygroundRequestModel>? playgrounds;
  final String? erorrMessage;
  final String? successMessage;

  TrackGroundsState({
    required this.state,
    this.playgrounds,
    this.erorrMessage,
    this.successMessage,
  });
}
