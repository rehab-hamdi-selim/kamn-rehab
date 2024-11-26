import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
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
          const CustomPaymentOptionsList(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 25.w, top: 40.h, bottom: 25.h),
              child: Text(
                'New Added',
                style: TextStyles.font15BlackColorMedium,
              ),
            ),
          ),
          const CustomPaymentOptionsList(),
        ],
      ),
      bottomNavigationBar: CustomButton(
        onTap: () {},
      ),
    );
  }
}
