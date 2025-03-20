import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/home_cooked__features/data/models/meals_model.dart';

Widget fooddetailsInfo() {
  return Row(
    children: [
      Text(
        "4.8 ⭐",
        style: TextStyles.fontCircularSpotify14LightBlackRegular,
      ),
      Text(
        " 120",
        style: TextStyles.fontCircularSpotify10Gray2Regular,
      ),
      horizontalSpace(12.w),
      Text(
        "🔥 ${fakeMeals[0].calories.toString()} ${Constants.kCal}",
        style: TextStyles.fontCircularSpotify14GrayRegular,
      ),
      horizontalSpace(12.w),
      Container(
        width: 78.w,
        height: 28.h,
        decoration: BoxDecoration(
          color: AppPallete.lightGreen,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              horizontalSpace(1.w),
              Image.asset(
                ImageLinks.cooking,
                width: 15.w,
                height: 15.h,
              ),
              Text(
                "${fakeMeals[0].prepTime} ${Constants.minute}",
                style: TextStyles.fontCircularSpotify12WhiteBold,
              ),
              horizontalSpace(1.w),
            ],
          ),
        ),
      )
    ],
  );
}