import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';


class CustomGeneralButton extends StatelessWidget{
  final String textButton;
  final VoidCallback ontab;
  final double? buttonWidth;
  final Color buttonColor;
  final Color buttonTextColor;

  const CustomGeneralButton({super.key, required this.textButton, required this.ontab, this.buttonWidth, required this.buttonColor, required this.buttonTextColor});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth ?? double.infinity,
      height: 35.h,
      child: ElevatedButton(
        onPressed: ontab,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(45.r),
          ),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10.w,
          children: [
            Icon(Icons.add,size:15.h,color:AppPallete.whiteColor),
            Text(
              textButton,
              style: TextStyles.fontCircularSpotify10StealGrayMedium.copyWith(color: AppPallete.whiteColor)
            ),
          ],
        ),
      ),
    );
  }
}