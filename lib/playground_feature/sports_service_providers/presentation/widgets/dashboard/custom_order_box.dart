import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomOrderBox extends StatelessWidget {
  const CustomOrderBox(
      {super.key,
      required this.title,
      required this.titleIcon,
      required this.num,
      required this.ratio,
      required this.color, required this.photo});
  final String title;
  final IconData titleIcon;
  final int num;
  final double ratio;
  final Color color;
  final String photo;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 160.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.25),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                titleIcon,
                color: color,
                size: 20.w,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                title,
                style: TextStyles.fontCircularSpotify10Medium,
              ),
              const Spacer(),
              Icon(
                Icons.more_vert,
                color: AppPallete.blackColor,
                size: 20.w,
              ),
            ],
          ),
          Text(
            num.toString(),
            style: TextStyles.fontCircularSpotify15MediumBlack
                .copyWith(fontSize: 24.h),
          ),
          Row(
            children: [
              SvgPicture.asset(photo),
              RichText(
                  text: TextSpan(
                      text: '$ratio%',
                      style: TextStyles.fontCircularSpotify10Medium
                          .copyWith(color: AppPallete.greenColor),
                      children: [
                    TextSpan(
                      text: 'less than last month',
                      style: TextStyles.fontCircularSpotify10Medium
                          .copyWith(color: AppPallete.greyColor),
                    )
                  ]))
            ],
          )
        ],
      ),
    );
  }
}
