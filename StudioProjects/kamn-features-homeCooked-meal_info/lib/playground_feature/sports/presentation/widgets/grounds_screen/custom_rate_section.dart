import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomRateSection extends StatelessWidget {
  const CustomRateSection({super.key, required this.rates});
  final String rates;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        color: AppPallete.whiteColor,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppPallete.lightGreyColor,
          width: 1.w,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            rates,
            style: TextStyles.fontCircularSpotify10BlackRegular,
          ),
          Icon(
            Icons.star,
            size: 12.h,
            color: AppPallete.yellowColor,
          ),
        ],
      ),
    );
  }
}
