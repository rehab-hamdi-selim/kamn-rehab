import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/features/payment/presentation/cubits/payment_options_cubit/payment_options_cubit.dart';
import 'package:kamn/features/payment/presentation/cubits/payment_options_cubit/payment_options_state.dart';
import 'package:kamn/features/payment/presentation/widgets/payment_options/custom_button.dart';
import 'package:kamn/features/payment/presentation/widgets/payment_options/custom_payment_options_list.dart';
import 'package:kamn/features/payment/presentation/widgets/payment_options/custom_payment_text.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_app_bar.dart';

class PaymentOptionsScreen extends StatelessWidget {
  const PaymentOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.whiteColor,
      appBar: CustomAppBar.appBar(
          arrowFunction: () {},
          notificationIconFunction: () {},
          profileFunction: () {},
          badgesIconFunction: () {},
          backGroundColor: AppPallete.whiteColor),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: CustomPaymentText(),
          ),
          BlocBuilder<PaymentOptionsCubit, PaymentOptionsState>(
            builder: (context, state) {
              return CustomPaymentOptionsList(
                paymentOptions: PaymentOptionsCubit.paymentOptions,
                currentOption: PaymentOptionsCubit.get(context).currentOption,
                itemOnTap: (index) =>
                    PaymentOptionsCubit.get(context).changePaymentOption(index),
              );
            },
          ),
          SliverToBoxAdapter(child: verticalSpace(10.h)),
        ],
      ),
      bottomNavigationBar: CustomButton(
        onTap: () {},
        text: 'Select Payment',
      ),
    );
  }
}
