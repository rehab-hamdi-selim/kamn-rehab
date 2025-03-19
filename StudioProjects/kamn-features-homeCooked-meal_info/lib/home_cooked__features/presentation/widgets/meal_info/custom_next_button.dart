import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomNextButton extends StatelessWidget {
  const CustomNextButton({
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
          borderRadius: BorderRadius.circular(69.20.r),
          side: BorderSide(width: 0.20.w, color: AppPallete.accentBlackColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyles.fontInter19WhiteSemiBold,
          ),
          SizedBox(
            width: 8.w,
          ),
          Icon(
            icons,
            color: AppPallete.lightWiteColor,
          ),
        ],
      ),
    );
  }
}
