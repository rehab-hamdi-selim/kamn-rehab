import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';

class CustomProceedPaymentDetails extends StatelessWidget {
  const CustomProceedPaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category Text
        Text(
          'Football',
          style: TextStyles.font16RobotogreenMedium,
        ),
        Text(
          'Hadra Stadium.\nEst.1',
          style: TextStyles.font30accentBlackColorMedium,
        ),
        verticalSpace(53.h),
        // Price Text
        Text(
          '275 LE',
          style: TextStyles.font45RobtoBlackColorMedium,
        ),
        verticalSpace(36.h),
        RichText(
          text: TextSpan(
              style: TextStyles.font14RobtoAccentBlackColorLight,
              children: const [
                TextSpan(
                  text: 'Monday, 16 Sep 2024\n',
                ),
                TextSpan(text: '6:30 PM to 7:30 PM')
              ]),
        ),
      ],
    );
  }
}
