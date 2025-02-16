import '../../../../../core/const/icon_links.dart';
import 'package:injectable/injectable.dart';

@injectable
class PaymentOptionsViewModel {
  List<PaymentOption> paymentOptions = [
    PaymentOption(PaymentOptionType.debitCreditCard, IconLinks.wallet),
    PaymentOption(PaymentOptionType.cash, IconLinks.cash),
    PaymentOption(PaymentOptionType.wallet, IconLinks.wallet),
  ];
}

enum PaymentOptionType {
  debitCreditCard,
  cash,
  wallet,
}

class PaymentOption {
  final PaymentOptionType type;
  final String iconLink;

  PaymentOption(this.type, this.iconLink);
}
