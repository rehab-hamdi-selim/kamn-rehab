part of 'procced_payment_cubit.dart';

enum ProccedPaymentStatus {
  initial,
  loading,
  failure,
  success,
}

extension ProccedPaymentStateExtension on ProccedPaymentState {
  bool get isInitial => state == ProccedPaymentStatus.initial;
  bool get isLoading => state == ProccedPaymentStatus.loading;
  bool get isSuccess => state == ProccedPaymentStatus.success;
  bool get isFailure => state == ProccedPaymentStatus.failure;
}

class ProccedPaymentState {
  final ProccedPaymentStatus? state;
  final String? errorMessage;
  final ReservationModel? reservation;

  const ProccedPaymentState({
    required this.state,
    this.errorMessage,
    this.reservation,
  });

  ProccedPaymentState copyWith(
      {ProccedPaymentStatus? state,
      String? errorMessage,
      ReservationModel? reservation}) {
    return ProccedPaymentState(
        state: state ?? this.state,
        errorMessage: errorMessage ?? this.errorMessage,
        reservation: reservation ?? this.reservation);
  }
}
