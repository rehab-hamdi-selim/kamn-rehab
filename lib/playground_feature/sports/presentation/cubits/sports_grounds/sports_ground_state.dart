// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/foundation.dart';

import '../../../data/models/playground_model.dart';

enum SportsGroundsStatus {
  initial,
  loading,
  success,
  failure,
  changeDistance,
 
}

extension SportsGroundStateExtension on SportsGroundsState {
  bool get isInitial => state == SportsGroundsStatus.initial;
  bool get isLoading => state == SportsGroundsStatus.loading;
  bool get isSuccess => state == SportsGroundsStatus.success;
  bool get isFailure => state == SportsGroundsStatus.failure;
  bool get isChangeDistance => state == SportsGroundsStatus.changeDistance;

}

class SportsGroundsState {
  final SportsGroundsStatus state;
  final double? distance;
  final Map<String, List<PlaygroundModel>>? playgroundsMap; 
  final List<PlaygroundModel>? playgrounds;
  final String? erorrMessage;
  SportsGroundsState({
    required this.state,
    this.distance,
    this.playgroundsMap,
    this.playgrounds,
    this.erorrMessage,
  });

  SportsGroundsState copyWith({
    SportsGroundsStatus? state,
    double? distance,
    Map<String, List<PlaygroundModel>>? playgroundsMap,
    List<PlaygroundModel>? playgrounds,
    String? erorrMessage,
  }) {
    return SportsGroundsState(
      state: state ?? this.state,
      distance: distance ?? this.distance,
      playgroundsMap: playgroundsMap ?? this.playgroundsMap,
      playgrounds: playgrounds ?? this.playgrounds,
      erorrMessage: erorrMessage ?? this.erorrMessage,
    );
  }

  @override
  String toString() {
    return 'SportsGroundsState(state: $state, distance: $distance, playgroundsMap: $playgroundsMap, playgrounds: $playgrounds, erorrMessage: $erorrMessage)';
  }

  @override
  bool operator ==(covariant SportsGroundsState other) {
    if (identical(this, other)) return true;
  
    return 
      other.state == state &&
      other.distance == distance &&
      mapEquals(other.playgroundsMap, playgroundsMap) &&
      listEquals(other.playgrounds, playgrounds) &&
      other.erorrMessage == erorrMessage;
  }

  @override
  int get hashCode {
    return state.hashCode ^
      distance.hashCode ^
      playgroundsMap.hashCode ^
      playgrounds.hashCode ^
      erorrMessage.hashCode;
  }
}
