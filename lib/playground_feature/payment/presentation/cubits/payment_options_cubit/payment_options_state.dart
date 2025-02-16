// ignore_for_file: public_member_api_docs, sort_constructors_first

enum PaymentOptionsStatus {
  initial,
  changePaymentOption,
}

extension PaymentOptionStateExtension on PaymentOptionsState {
  bool get inInitial => state == PaymentOptionsStatus.initial;
  bool get inchangePaymentOption =>
      state == PaymentOptionsStatus.changePaymentOption;
}

class PaymentOptionsState {
  final PaymentOptionsStatus state;
  final int currentOption;
  PaymentOptionsState({
    required this.state,
    required this.currentOption,
  });

  PaymentOptionsState copyWith({
    PaymentOptionsStatus? state,
    int? currentOption,
  }) {
    return PaymentOptionsState(
      state: state ?? this.state,
      currentOption: currentOption ?? this.currentOption,
    );
  }

  @override
  String toString() =>
      'PaymentOptionsState(state: $state, currentOption: $currentOption)';

  @override
  bool operator ==(covariant PaymentOptionsState other) {
    if (identical(this, other)) return true;

    return other.state == state && other.currentOption == currentOption;
  }

  @override
  int get hashCode => state.hashCode ^ currentOption.hashCode;
}
