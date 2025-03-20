import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({
    this.width,
    this.heigh,
    super.key,
    required this.content,
  });
  final Widget content;
  double? width;
  double? heigh;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigh,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: AppPallete.ofWhiteColor,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppPallete.mediumLightGray),
      ),
      child: content,
    );
  }
}
