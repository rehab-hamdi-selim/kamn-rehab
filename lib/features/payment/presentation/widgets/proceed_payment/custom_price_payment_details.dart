import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/payment/presentation/widgets/proceed_payment/custom_price_payment_item.dart';

class CustomPricePaymentDetails extends StatelessWidget {
  const CustomPricePaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPricePaymentItem(
            name: 'Invoice',
            value: 'mariamdaheb#1234',
            textStyle: TextStyles.font14RobotoBlackColorRegular),
        verticalSpace(16.h),
        CustomPricePaymentItem(
            name: 'Bill to',
            value: 'mahmoud sayed',
            textStyle: TextStyles.font14RobotoBlackColorRegular),
        verticalSpace(16.h),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return CustomPricePaymentItem(
              name: 'Invoice',
              value: 'Monday',
              textStyle: TextStyles.font14RobtoAccentBlackColorLight,
            );
          },
          separatorBuilder: (context, index) => verticalSpace(16.h),
          itemCount: 4,
        )
      ],
    );
  }
}
