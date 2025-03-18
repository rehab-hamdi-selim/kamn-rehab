import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';


class CustomGymButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? width;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconData? icon;
  final bool showIcon;
  final bool isBackButton;
  final double? height;

  const CustomGymButton({
    super.key,
    required this.onPressed,
    this.text = 'Next',
    this.width,
    this.backgroundColor,
    this.foregroundColor,
    this.icon,
    this.showIcon = true,
    this.isBackButton = false, this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height:height?? 50.h,
        width: width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? AppPallete.blackColor,
            foregroundColor: foregroundColor ?? AppPallete.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(70.r),
              side: isBackButton ? BorderSide(
                color: AppPallete.lightGreyColor,
                width: .3.w,
              ) : BorderSide.none,
            ),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isBackButton) ...[                
                if (showIcon) Icon(
                  icon ?? Icons.arrow_back,
                  size: 15.h,
                  color: foregroundColor ?? AppPallete.whiteColor,
                ),
                 if (showIcon)horizontalSpace(8),
                Text(text),
              ] else ...[                
                Text(text),
                 if (showIcon)horizontalSpace(8),
                if (showIcon) Icon(
                  icon ?? Icons.arrow_forward,
                  size: 15.h,
                  color: foregroundColor ?? AppPallete.whiteColor,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
