import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/sports/data/models/reservation_model.dart';
import 'package:kamn/features/sports_service_providers/presentation/screens/current_reservation_order_screen.dart';

class CurrentOrdersTile extends StatelessWidget {
  final ReservationModel reservation;
  final int numOfActiveReservation;
  const CurrentOrdersTile(
      {super.key,
      required this.reservation,
      required this.numOfActiveReservation});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 16.w),
        margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5.r,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reservation.ground?.type ?? '',
                  style: TextStyles.fontCircularSpotify18Medium.copyWith(
                      color: SportsTabs.values
                          .firstWhere((element) =>
                              element.displayName == reservation.ground?.type)
                          .sportColor),
                ),
                Text(
                  reservation.ground?.playgroundName ?? '',
                  style: TextStyles.fontCircularSpotify15MediumBlack,
                ),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined,
                        size: 14.sp, color: AppPallete.greyColor),
                    horizontalSpace(5.w),
                    Text(
                      reservation.ground?.address ?? '',
                      style: TextStyles.fontCircularSpotify7RegularGrey,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            Container(
              width: 50.w,
              height: 26.h,
              decoration: BoxDecoration(
                color: const Color(0xffFFDC77).withOpacity(0.25),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined,
                      size: 16.sp, color: const Color(0xffE67240)),
                  horizontalSpace(5),
                  Text(
                    "$numOfActiveReservation",
                    style: TextStyles.fontCircularSpotify15MediumBlack
                        .copyWith(color: const Color(0xffF5B700)),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
