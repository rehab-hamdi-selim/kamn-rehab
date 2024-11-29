import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/features/payment/presentation/widgets/payment_options/custom_payment_options_item.dart';

class CustomPaymentOptionsList extends StatelessWidget {
  const CustomPaymentOptionsList(
      {super.key, required this.paymentIcons, required this.paymentName});
  final List paymentIcons;
  final List paymentName;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 19.w),
          child: CustomPaymentOptionsItem(
            onTap: () {
              print(paymentName[index]);
            },
            isSelected: index == 0 ?? false,
            paymentIcon: paymentIcons[index],
            paymentName: paymentName[index],
          ),
        );
      },
      separatorBuilder: (context, index) => verticalSpace(17.h),
      itemCount: paymentIcons.length,
    );
  }
}
