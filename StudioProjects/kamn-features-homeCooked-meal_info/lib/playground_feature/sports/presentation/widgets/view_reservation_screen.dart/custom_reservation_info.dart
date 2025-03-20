import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:kamn/core/const/icon_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomReservationInfo extends StatelessWidget {
  const CustomReservationInfo(
      {super.key,
      required this.timeToStart,
      required this.timeToEnd,
      required this.price});
  final DateTime timeToStart;
  final DateTime timeToEnd;
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('EEEE, d MMM yyyy').format(timeToStart),
                      style: TextStyles.fontRoboto11BlueRegular
                          .copyWith(color: AppPallete.whiteColor),
                    ),
                    Text(
                      "${DateFormat.jm().format(timeToStart)} to ${DateFormat.jm().format(timeToEnd)}",
                      style: TextStyles.fontRoboto11BlueRegular
                          .copyWith(color: AppPallete.whiteColor),
                    )
                  ],
                ),
              ],
            ),
            const Spacer(),
            RichText(
                text: TextSpan(
                    text: '${price.toStringAsFixed(2)} LE',
                    style: TextStyles.fontCircularSpotify18LightMedium,
                    children: [
                  TextSpan(
                      text: '/ hr',
                      style: TextStyles.fontCircularSpotify11LightRegular),
                ]))
          ],
        ),
      ),
    );
  }
}
