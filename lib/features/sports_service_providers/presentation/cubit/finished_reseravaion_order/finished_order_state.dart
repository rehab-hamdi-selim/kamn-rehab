// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:kamn/features/sports/data/models/reservation_model.dart';

enum FinishedOrdersStatus { initial, loading, success, failure }

extension FinishedOrderStateExtension on FinishedOrdersState {
   bool get isInitial => state == FinishedOrdersStatus.initial;
  bool get isLoading => state == FinishedOrdersStatus.loading;
  bool get isSuccess => state == FinishedOrdersStatus.success;
  bool get isFailure => state == FinishedOrdersStatus.failure;
}

class FinishedOrdersState {
  final FinishedOrdersStatus? state;
  final String? errorMessage;
  final List<ReservationModel>? reservations;
  FinishedOrdersState({
    required this.state,
    this.errorMessage,
    this.reservations,
  });
  

  FinishedOrdersState copyWith({
    FinishedOrdersStatus? state,
    String? errorMessage,
    List<ReservationModel>? reservations,
  }) {
    return FinishedOrdersState(
      state: state ?? this.state,
      errorMessage: errorMessage ?? this.errorMessage,
      reservations: reservations ?? this.reservations,
    );
  }

  @override
  String toString() => 'FinishedOrdersState(state: $state, errorMessage: $errorMessage, reservations: $reservations)';
}
