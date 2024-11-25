import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';

class PaymentText extends StatelessWidget {
  const PaymentText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 27.w, right: 95.w, top: 20.h, bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Constants.paymentOptions,
            style: TextStyles.font30DarkGreenColorMedium,
          ),
          verticalSpace(10.h),
          Text(
            'select your payment method',
            style: TextStyles.fontRoboto12DarkGreyMedium,
          ),
        ],
      ),
    );
  }
}
