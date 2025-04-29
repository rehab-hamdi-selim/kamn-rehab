import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class RoundedBorderButton extends StatelessWidget {
  const RoundedBorderButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 9.h),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 2.w,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: AppPallete.tooLightGray,
            ),
            borderRadius: BorderRadius.circular(33.r),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 9),
            child: Text(
              text,
              style: TextStyles.circularSpotify14RegularDarkBlack,
            ),
          ),
        ),
      ),
    );
  }
}
