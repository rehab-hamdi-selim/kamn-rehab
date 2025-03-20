import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

Widget customPositionedHomeCookName() {
  return Positioned(
              top: 245.h,
              left: 15.w,
              child: Container(
                width: 153.w,
                height: 41.h,
                decoration: BoxDecoration(
                  color: AppPallete.whiteColor,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Center(
                    child: Text(
                  "Sarah’s House",
                  style: TextStyles.fontCircularSpotify14AccentBlackMedium,
                )),
              ),
            );
}