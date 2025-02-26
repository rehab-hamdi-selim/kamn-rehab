import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/theme/style.dart';

class CustomButton extends StatelessWidget {
 final String buttonText;
 final  void Function()? onTapButton;

  const CustomButton({super.key, required this.buttonText,required this.onTapButton});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTapButton,
        child: Container(
          height: 44.h,
          width: 305.w,
          decoration:  BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppPallete.lightVividVioletColor,
                AppPallete.darkVividVioletColor,
              ],),
              borderRadius: BorderRadius.circular(38.r),
          ),
          child: Center(
            child: Text(buttonText,
                style: TextStyles.fontRoboto14WhiteBold),
          ),
        ),
      );
  }
}