import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/features/payment/presentation/widgets/proceed_payment/custom_price_payment_item.dart';

class CustomPricePaymentDetails extends StatelessWidget {
  const CustomPricePaymentDetails({super.key});
  static const Map<String, dynamic> data = {
    'Invoice': 'mariamdaheb#1234',
    'Bill to': 'mahmoud sayed',
    'Invoice date': 'Monday, 16 Sep 2024',
    'Amount due': '250 LE',
    'Fees': '25 LE',
    'Total': '275 LE',
  };
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CustomPricePaymentItem(
          name: data.entries.elementAt(index).key,
          value: data.entries.elementAt(index).value,
        );
      },
      separatorBuilder: (context, index) => verticalSpace(16.h),
      itemCount: data.length,
    );
  }
}
