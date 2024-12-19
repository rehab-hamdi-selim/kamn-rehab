import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/sports/presentation/widgets/view_reservation_screen.dart/custom_reservation_background_image.dart';
import 'package:kamn/features/sports/presentation/widgets/view_reservation_screen.dart/custom_reservation_ground_info.dart';
import 'package:kamn/features/sports/presentation/widgets/view_reservation_screen.dart/custom_reservation_info.dart';

class CustomReservationItem extends StatelessWidget {
  const CustomReservationItem(
      {super.key,
      required this.groundName,
      required this.ownreName,
      required this.address,
      required this.rate,
      required this.review,
      required this.date,
      required this.timeToStart,
      required this.timeToEnd,
      required this.price});
  final String groundName;
  final String ownreName;
  final String address;
  final num rate;
  final int review;
  final String date;
  final String timeToStart;
  final String timeToEnd;
  final num price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: AppPallete.whiteColor,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: AppPallete.lightGreenColor.withOpacity(0.3),
            width: 1.w,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const CustomReservationBackgroundImage(),
            Positioned(
              top: 15.h,
              child: Column(
                children: [
                  Text(
                    groundName,
                    style: TextStyles.font16LightColorCircularSpotifyRegular,
                  ),
                ],
              ),
            ),
            CustomReservationGroundInfo(
              ownreName: ownreName,
              address: address,
              rate: rate,
              review: review,
            ),
            CustomReservationInfo(
              date: date,
              price: price,
              timeToEnd: timeToEnd,
              timeToStart: timeToStart,
            )
          ],
        ),
      ),
    );
  }
}
