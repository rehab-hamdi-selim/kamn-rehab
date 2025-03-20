import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';

class CustomCircularButton extends StatelessWidget {
  const CustomCircularButton({
    super.key,
    required this.icon,
    this.onTap,
  });
  final void Function()? onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: AppPallete.greytrans,
          shape: BoxShape.circle,
          border: Border.all(color: AppPallete.offWhite, width: 2.w),
        ),
        alignment: Alignment.center,
        child: Icon(
          icon,
          color: AppPallete.offWhite,
        ),
      ),
    );
  }
}
