import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.text});
  final VoidCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppPallete.darkGreenColor,
              padding: EdgeInsets.symmetric(vertical: 14.h),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60.r))),
          onPressed: onTap,
          child: Text(
            text,
            style: TextStyles.fontRoboto24MediumWhite,
          )),
    );
  }
}
