
import 'package:kamn/playground_feature/sports/data/models/reservation_model.dart';

enum CurrentOrdersStatus { initial, loading, success, failure }

extension CurrentOrderStateExtension on CurrentOrdersState {
   bool get isInitial => state == CurrentOrdersStatus.initial;
  bool get isLoading => state == CurrentOrdersStatus.loading;
  bool get isSuccess => state == CurrentOrdersStatus.success;
  bool get isFailure => state == CurrentOrdersStatus.failure;
}

class CurrentOrdersState {
  final CurrentOrdersStatus? state;
  final String? errorMessage;
  final List<ReservationModel>? reservations;
  CurrentOrdersState({
    required this.state,
    this.errorMessage,
    this.reservations,
  });
  

  CurrentOrdersState copyWith({
    CurrentOrdersStatus? state,
    String? errorMessage,
    List<ReservationModel>? reservations,
  }) {
    return CurrentOrdersState(
      state: state ?? this.state,
      errorMessage: errorMessage ?? this.errorMessage,
      reservations: reservations ?? this.reservations,
    );
  }
    @override
  String toString() =>
      'AppUserState(state: $state, user: $reservations, errorMessage: $errorMessage )';
}
