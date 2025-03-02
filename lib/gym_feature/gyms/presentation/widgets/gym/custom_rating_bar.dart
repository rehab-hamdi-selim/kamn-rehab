import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({super.key, required this.rate});

  final String rate;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5.w, right: 2.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99.h),
          color: AppPallete.lighttColor2),
      child: Row(
        children: [
          Text(
            rate,
            style: TextStyles.fontCircularSpotify10BlackRegular,
          ),
          const Icon(
            Icons.star,
            size: 15,
            color: AppPallete.lightOrangeColor,
          )
        ],
      ),
    );
  }
}
