import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/const/icon_links.dart';
import 'package:kamn/features/payment/presentation/cubits/payment_options_cubit/payment_options_state.dart';

class PaymentOptionsCubit extends Cubit<PaymentOptionsState> {
  PaymentOptionsCubit()
      : super(PaymentOptionsState(state: PaymentOptionsStatus.initial));

  static PaymentOptionsCubit get(context) => BlocProvider.of(context);
  static const Map paymentOptions = {
    'Debit / Credit Card': IconLinks.wallet,
    'Bank Account': IconLinks.bank,
    'Google pay': IconLinks.google,
    'PayPal': IconLinks.paypal,
    'Wallet': IconLinks.wallet,
    'Fawry': IconLinks.fawry,
  };
  int currentOption = -1;

  void changePaymentOption(int option) {
    currentOption = option;
    emit(PaymentOptionsState(state: PaymentOptionsStatus.changePaymentOption));
  }
}
