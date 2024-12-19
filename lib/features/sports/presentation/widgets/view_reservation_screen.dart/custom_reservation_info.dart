import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/const/icon_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';

class CustomReservationInfo extends StatelessWidget {
  const CustomReservationInfo(
      {super.key,
      required this.date,
      required this.timeToStart,
      required this.timeToEnd,
      required this.price});
  final String date;
  final String timeToStart;
  final String timeToEnd;
  final num price;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.only(left: 12.w, right: 8.w, bottom: 6.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  IconLinks.calender,
                  height: 23.h,
                  width: 21.w,
                ),
                horizontalSpace(2.85),
                Text(
                  '$date\n$timeToStart to $timeToEnd',
                  style: TextStyles.fontCircularSpotify10Regular,
                ),
              ],
            ),
            const Spacer(),
            RichText(
                text: TextSpan(
                    text: '$price LE',
                    style: TextStyles.fontCircularSpotify18Medium,
                    children: [
                  TextSpan(
                      text: '/ hr',
                      style: TextStyles.fontCircularSpotify11Regular),
                ]))
          ],
        ),
      ),
    );
  }
}
