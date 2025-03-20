import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/theme/app_pallete.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      height: 20.h,
      decoration: ShapeDecoration(
        color: AppPallete.ofWhiteColor4,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.83.w,
            color: const Color(
              0xFFE5E7EB,
            ),
          ),
          borderRadius: BorderRadius.circular(6.67.r),
        ),
        shadows: [
          BoxShadow(
            color: const Color(
              0x0C000000,
            ),
            blurRadius: 1.67.r,
            offset: Offset(0.h, 0.83.w),
            spreadRadius: 0.r,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 13.33.w,
            height: 13.33.h,
            child: SvgPicture.asset(icon),
          ),
        ],
      ),
    );
  }
}
