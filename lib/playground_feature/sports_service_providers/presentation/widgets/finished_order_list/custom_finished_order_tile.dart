import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/playground_feature/sports/data/models/reservation_model.dart';

class CustomFinishedOrdersTile extends StatelessWidget {
  final ReservationModel reservation;

  const CustomFinishedOrdersTile({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppPallete.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: AppPallete.lightGreyColor, width: 0.5.w),
        ),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          reservation.ground?.type ?? '',
                          style: TextStyles.fontCircularSpotify18LightMedium
                              .copyWith(
  color: Sport.values
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
                            const Icon(
                              Icons.location_on_outlined,
                              color: AppPallete.greyColor,
                              size: 12,
                            ),
                            horizontalSpace(4.w),
                            Text(
                              reservation.ground?.address ?? '',
                              style: TextStyles.fontCircularSpotify7RegularGrey,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 21.w,
                      height: 21.w,
                      decoration: BoxDecoration(
                          color: const Color(0xff77FF7C).withOpacity(0.25),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(4.r)),
                      child: const Icon(
                        size: 14,
                        Icons.check_circle_outlined,
                        color: AppPallete.greenColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/user.svg",
                      color: AppPallete.blackColor,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: 'Reserved by: ',
                          style: TextStyles.fontCircularSpotify12GrayRegular
                              .copyWith(fontSize: 12.5.h),
                          children: [
                            TextSpan(
                                text: '\n${reservation.user?.name ?? ''}',
                                style: TextStyles.fontCircularSpotify11LightRegular
                                    .copyWith(
                                        color: AppPallete.greenColor,
                                        fontSize: 12.5.h))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    SvgPicture.asset(
                      'assets/icons/phone.svg',
                      color: AppPallete.blackColor,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '0123 567 90',
                      style: TextStyles.fontCircularSpotify12GrayRegular
                          .copyWith(
                              fontSize: 12.5.h, color: AppPallete.greenColor),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    const Icon(Icons.check_circle_outline_outlined),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: reservation.paymentMethod ?? '',
                          style: TextStyles.fontCircularSpotify12GrayRegular
                              .copyWith(fontSize: 12.5.h),
                          children: [
                            TextSpan(
                              text: '\n Paid: ${reservation.price} / hr',
                              style: TextStyles.fontCircularSpotify15MediumBlack
                                  .copyWith(
                                      fontSize: 12.h,
                                      color: AppPallete.greenColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    SvgPicture.asset(
                      "assets/icons/reservation.svg",
                    ),
                    SizedBox(width: 4.w),
                    Column(
                      children: [
                        Text(
                          DateFormat('EEEE, dd MMM yyyy')
                              .format(reservation.startAt!),
                          style: TextStyles.fontCircularSpotify12GrayRegular
                              .copyWith(
                                  fontSize: 12.5.h,
                                  color: AppPallete.greenColor),
                        ),
                        verticalSpace(4.h),
                        Text(
                          '${DateFormat.jm().format(reservation.startAt!)} to ${DateFormat.jm().format(reservation.endAt!)}',
                          style: TextStyles.fontCircularSpotify12GrayRegular
                              .copyWith(
                                  fontSize: 12.5.h,
                                  color: AppPallete.greenColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
        ));
  }
}
