import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/playground_feature/sports/data/models/playground_model.dart';
import 'package:kamn/playground_feature/sports/data/models/reservation_model.dart';
import 'package:kamn/playground_feature/sports/presentation/widgets/view_reservation_screen.dart/custom_reservation_background_image.dart';
import 'package:kamn/playground_feature/sports/presentation/widgets/view_reservation_screen.dart/custom_reservation_ground_info.dart';
import 'package:kamn/playground_feature/sports/presentation/widgets/view_reservation_screen.dart/custom_reservation_info.dart';

class CustomReservationItem extends StatelessWidget {
  const CustomReservationItem({super.key, required this.reservation});
  final ReservationModel reservation;
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
                    reservation.ground?.playgroundName ?? '',
                    style: TextStyles.font16LightColorCircularSpotifyRegular,
                  ),
                ],
              ),
            ),
            CustomReservationGroundInfo(
              ownreName: reservation.ground?.playgroundName ?? '',
              address: reservation.ground?.address ?? '',
              rate: reservation.ground?.ratings ?? 0,
              review: 0,
            ),
            CustomReservationInfo(
              price: reservation.price ?? 0,
              timeToEnd: reservation.endAt ?? DateTime.now(),
              timeToStart: reservation.startAt ?? DateTime.now(),
            )
          ],
        ),
      ),
    );
  }
}
