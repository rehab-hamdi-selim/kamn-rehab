import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/features/payment/presentation/widgets/payment_options/custom_button.dart';
import 'package:kamn/features/payment/presentation/widgets/proceed_payment/custom_price_payment_details.dart';
import 'package:kamn/features/payment/presentation/widgets/proceed_payment/custom_proceed_payment_details.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_app_bar.dart';

class ProceedPaymentScreen extends StatelessWidget {
  const ProceedPaymentScreen({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsetsDirectional.only(start: 23.w, top: 30.h, end: 22.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomProceedPaymentDetails(),
              verticalSpace(36.h),
              const CustomPricePaymentDetails(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomButton(onTap: () {}, text: 'Proceed payment'),
    );
  }
}
