// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

import '../../../data/models/playground_model.dart';

enum SportsGroundsStatus {
  initial,
  loading,
  success,
  failure,
  changeDistance,
  isScrollingUp,
  isReturnedToTop,
  isScrolledDown
}

extension SportsGroundStateExtension on SportsGroundsState {
  bool get isInitial => state == SportsGroundsStatus.initial;
  bool get isLoading => state == SportsGroundsStatus.loading;
  bool get isSuccess => state == SportsGroundsStatus.success;
  bool get isFailure => state == SportsGroundsStatus.failure;
  bool get isChangeDistance => state == SportsGroundsStatus.changeDistance;
  bool get isScrolledDown => state == SportsGroundsStatus.isScrolledDown;
  bool get isReturnedToTop => state == SportsGroundsStatus.isReturnedToTop;
}

class SportsGroundsState {
  final SportsGroundsStatus state;
  final double? distance;
  final List<PlaygroundModel>? playgrounds;
  final String? erorrMessage;
  SportsGroundsState({
    required this.state,
    this.distance,
    this.playgrounds,
    this.erorrMessage,
  });

  SportsGroundsState copyWith({
    SportsGroundsStatus? state,
    double? distance,
    List<PlaygroundModel>? playgrounds,
    String? erorrMessage,
  }) {
    return SportsGroundsState(
      state: state ?? this.state,
      distance: distance ?? this.distance,
      playgrounds: playgrounds ?? this.playgrounds,
      erorrMessage: erorrMessage ?? this.erorrMessage,
    );
  }

  @override
  String toString() {
    return 'SportsGroundsState(state: $state, distance: $distance, playgrounds: $playgrounds, erorrMessage: $erorrMessage)';
  }

  @override
  bool operator ==(covariant SportsGroundsState other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.state == state &&
        other.distance == distance &&
        listEquals(other.playgrounds, playgrounds) &&
        other.erorrMessage == erorrMessage;
  }

  @override
  int get hashCode {
    return state.hashCode ^
        distance.hashCode ^
        playgrounds.hashCode ^
        erorrMessage.hashCode;
  }
}
