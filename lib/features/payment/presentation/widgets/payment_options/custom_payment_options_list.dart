import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/features/payment/presentation/widgets/payment_options/custom_payment_options_item.dart';

class CustomPaymentOptionsList extends StatelessWidget {
  const CustomPaymentOptionsList(
      {super.key,
      required this.currentOption,
      required this.itemOnTap,
      required this.paymentOptions});
  final Map paymentOptions;
  final int currentOption;
  final Function itemOnTap;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 19.w),
          child: CustomPaymentOptionsItem(
            onTap: () => itemOnTap(index),
            isSelected: index == currentOption ?? false,
            paymentIcon: paymentOptions.entries.elementAt(index).value,
            paymentName: paymentOptions.entries.elementAt(index).key,
          ),
        );
      },
      separatorBuilder: (context, index) => verticalSpace(17.h),
      itemCount: paymentOptions.length,
    );
  }
}
