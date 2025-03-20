import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/theme/style.dart';

Widget customRequiredTxt(String txt) {
  return Row(
            children: [
              Text(
                txt,
                style: TextStyles.circularSpotify14RegularDarkBlack,
              ),
              Image.asset(ImageLinks.requred_star, width: 6.w, height: 17.h),
            ],
);
}