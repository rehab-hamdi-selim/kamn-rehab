// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:kamn/features/sports/data/models/playground_model.dart';

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
  final List<PlaygroundModel>? playgrounds;
  final String? erorrMessage;
  final String? successMessage;

  TrackGroundsState({
    required this.state,
    this.playgrounds,
    this.erorrMessage,
    this.successMessage,
  });

  @override
  String toString() {
    return 'TrackGroundsState(state: $state, playgrounds: $playgrounds, erorrMessage: $erorrMessage, successMessage: $successMessage)';
  }
}
