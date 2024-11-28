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
  PaymentOptionsState({required this.state});
}
