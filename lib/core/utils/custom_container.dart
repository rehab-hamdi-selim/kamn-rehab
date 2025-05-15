import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.horizontalPadding = 20,
    this.alignment = CrossAxisAlignment.start,
    required this.children,
  });
  final double? horizontalPadding;
  final CrossAxisAlignment? alignment;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppPallete.ofWhiteColor,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppPallete.mediumLightGray, width: 0.2),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding!.w, vertical: 10.h),
      width: double.infinity,
      child: Column(crossAxisAlignment: alignment!, children: children),
    );
  }
}
