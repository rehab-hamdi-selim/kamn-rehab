import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/const/constants.dart';
import '../../../../../core/theme/app_pallete.dart';
import '../../../../../core/theme/style.dart';

class CustomYourNextMatchTimer extends StatelessWidget {
  const CustomYourNextMatchTimer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 19.w),
      decoration: BoxDecoration(
        color: AppPallete.lightGreenColorWithOpacity07,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppPallete.lightGreenColor,
          width: 1.w,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            Constants.nextMatch,
            style: TextStyles.font15DarkGreenColorBold,
          ),
          Text(
            "00 : 52 : 36",
            style: TextStyles.font15DarkGreenColorBold,
          ),
        ],
      ),
    );
  }
}
