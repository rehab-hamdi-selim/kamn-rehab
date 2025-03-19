import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    required this.text,
    required this.icons,
    required this.color,
  });

  final String text;
  final IconData icons;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.h,
      padding: const EdgeInsets.all(10.64),
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.20.w, color: AppPallete.lightGreyColor),
          borderRadius: BorderRadius.circular(69.20.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icons,
            color: AppPallete.accentBlackColor,
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyles.fontInter16BlackRegular,
          ),
        ],
      ),
    );
  }
}
