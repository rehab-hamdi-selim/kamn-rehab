import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/icon_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/features/payment/presentation/widgets/payment_options/custom_payment_options_item.dart';

class CustomPaymentOptionsList extends StatelessWidget {
  const CustomPaymentOptionsList({super.key});
  static const List paymentIcons = [
    IconLinks.wallet,
    IconLinks.bank,
    IconLinks.google,
    IconLinks.paypal,
  ];
  static const List paymentName = [
    'Debit / Credit Card',
    'Bank Account',
    'Google pay',
    'PayPal'
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 19.w),
          child: CustomPaymentOptionsItem(
            onTap: () {
              print('Hallo');
            },
            isSelected: index == 0 ?? false,
            paymentIcon: paymentIcons[index],
            paymentName: paymentName[index],
          ),
        );
      },
      separatorBuilder: (context, index) => verticalSpace(20.h),
      itemCount: paymentIcons.length,
    );
  }
}
