// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../../data/models/playground_model.dart';

enum SportsGroundsStatus {
  initial,
  loading,
  success,
  failure,
  onChanged,
  filtter
}

extension SportsGroundStateExtension on SportsGroundsState {
  bool get isInitial => state == SportsGroundsStatus.initial;
  bool get isLoading => state == SportsGroundsStatus.loading;
  bool get isSuccess => state == SportsGroundsStatus.success;
  bool get isFailure => state == SportsGroundsStatus.failure;
  bool get isFiltter => state == SportsGroundsStatus.filtter;
}

class SportsGroundsState {
  final SportsGroundsStatus state;
  final List<PlaygroundModel>? playgrounds;
  final double distanceFilterValue;
  final String? erorrMessage;
  SportsGroundsState({
    required this.state,
    this.playgrounds,
    this.distanceFilterValue = 0,
    this.erorrMessage,
  });

  SportsGroundsState copyWith({
    SportsGroundsStatus? state,
    List<PlaygroundModel>? playgrounds,
    double? distanceFilterValue,
    String? erorrMessage,
  }) {
    return SportsGroundsState(
      state: state ?? this.state,
      playgrounds: playgrounds ?? this.playgrounds,
      distanceFilterValue: distanceFilterValue ?? this.distanceFilterValue,
      erorrMessage: erorrMessage ?? this.erorrMessage,
    );
  }

  @override
  String toString() {
    return 'SportsGroundsState(state: $state, distanceFilterValue: $distanceFilterValue, erorrMessage: $erorrMessage)';
  }

  @override
  bool operator ==(covariant SportsGroundsState other) {
    if (identical(this, other)) return true;

    return other.state == state &&
        listEquals(other.playgrounds, playgrounds) &&
        other.distanceFilterValue == distanceFilterValue &&
        other.erorrMessage == erorrMessage;
  }

  @override
  int get hashCode {
    return state.hashCode ^
        playgrounds.hashCode ^
        distanceFilterValue.hashCode ^
        erorrMessage.hashCode;
  }
}
