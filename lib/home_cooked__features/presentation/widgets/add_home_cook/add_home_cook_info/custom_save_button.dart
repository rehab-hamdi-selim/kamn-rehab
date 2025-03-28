import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomSaveButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const CustomSaveButton({super.key, required this.onPressed, required this.title});


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              fixedSize: Size(315.w, 50.h),
              foregroundColor: AppPallete.whiteColor,
              backgroundColor: AppPallete.blackColor,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageLinks.check, width: 14.w, height: 14.h),
                horizontalSpace(10.w),
                Text(title,
                    style: TextStyles.fontCircularSpotify14WhiteMedium),
              ],
            ),
          );
  }
}