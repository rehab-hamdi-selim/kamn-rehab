import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.onTap,
    this.backcolor,
    required this.content,
  });
  final Color? backcolor;
  final void Function()? onTap;
  final List<Widget> content;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 162.w,
        height: 50.h,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 11.w),
        decoration: BoxDecoration(
          color: backcolor,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(color: AppPallete.mediumLightGray),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: content,
        ),
      ),
    );
  }
}
