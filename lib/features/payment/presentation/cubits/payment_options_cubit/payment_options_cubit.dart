import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/features/payment/presentation/cubits/payment_options_cubit/payment_options_state.dart';

class PaymentOptionsCubit extends Cubit<PaymentOptionsState> {
  PaymentOptionsCubit()
      : super(PaymentOptionsState(
            state: PaymentOptionsStatus.initial, currentOption: -1));

  static PaymentOptionsCubit get(context) => BlocProvider.of(context);

  void changePaymentOption(int option) {
    emit(PaymentOptionsState(
        state: PaymentOptionsStatus.changePaymentOption,
        currentOption: option));
  }
}
