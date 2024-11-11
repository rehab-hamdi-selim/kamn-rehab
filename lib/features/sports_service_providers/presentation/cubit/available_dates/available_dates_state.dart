import 'package:flutter/material.dart';

enum AvailableDatesStatus { initial, loading, success, failure, intervalsCalc }

extension SportsGroundStateExtension on AvailableDatesState {
  bool get isInitial => state == AvailableDatesStatus.initial;
  bool get isLoading => state == AvailableDatesStatus.loading;
  bool get isSuccess => state == AvailableDatesStatus.success;
  bool get isFailure => state == AvailableDatesStatus.failure;
  bool get isIntervalsClac => state == AvailableDatesStatus.intervalsCalc;
}

class AvailableDatesState {
  final AvailableDatesStatus state;
  TimeOfDay? startAt;
  TimeOfDay? endAt;
  List<String>? intervials;
  final String? erorrMessage;
  final String? successMessage;

  AvailableDatesState({
    required this.state,
    this.erorrMessage,
    this.endAt,
    this.intervials,
    this.startAt,
    this.successMessage,
  });
  AvailableDatesState copyWith({
    AvailableDatesStatus? state,
    TimeOfDay? startAt,
    TimeOfDay? endAt,
    List<String>? intervials,
    String? erorrMessage,
    String? successMessage,
  }) {
    return AvailableDatesState(
      state: state ?? this.state,
      erorrMessage: erorrMessage ?? this.erorrMessage,
      startAt: startAt ?? this.startAt,
      intervials: intervials ?? this.intervials,
      endAt: endAt ?? this.endAt,
      successMessage: successMessage ?? this.successMessage,
    );
  }
}
