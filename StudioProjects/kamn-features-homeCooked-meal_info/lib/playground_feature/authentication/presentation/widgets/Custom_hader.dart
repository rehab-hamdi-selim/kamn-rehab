import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import '../../../../core/theme/style.dart';

class CustomHader extends StatelessWidget {
  final String boldText;
  final String text;
  const CustomHader({super.key, required this.boldText, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          boldText,
          style: TextStyles.fontRoboto24BoldBlack,
        ),
        verticalSpace(16.h),
        Text(
          text,
          style: TextStyles.fontRoboto14BlackMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
