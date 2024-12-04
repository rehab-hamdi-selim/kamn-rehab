import '../../../../../core/const/icon_links.dart';
import 'package:injectable/injectable.dart';

@injectable
class PaymentOptionsViewModel {
  List<PaymentOption> paymentOptions = [
    PaymentOption(PaymentOptionType.debitCreditCard, IconLinks.wallet),
    PaymentOption(PaymentOptionType.bankAccount, IconLinks.bank),
    PaymentOption(PaymentOptionType.googlePay, IconLinks.google),
    PaymentOption(PaymentOptionType.paypal, IconLinks.paypal),
    PaymentOption(PaymentOptionType.wallet, IconLinks.wallet),
    PaymentOption(PaymentOptionType.fawry, IconLinks.fawry),
  ];
}

enum PaymentOptionType {
  debitCreditCard,
  bankAccount,
  googlePay,
  paypal,
  wallet,
  fawry,
}

class PaymentOption {
  final PaymentOptionType type;
  final String iconLink;

  PaymentOption(this.type, this.iconLink);
}
