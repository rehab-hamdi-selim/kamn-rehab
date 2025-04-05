import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/days_container.dart';

class OpenContainer extends StatelessWidget {
  const OpenContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 335.w,
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.w),
          decoration: ShapeDecoration(
            color: const Color(0xFFF6F6F6),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 0.20,
                color: Color(0xFFBBBBBB),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 12,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Open 24/7',
                              style: TextStyles.fontCircularSpotify16BlackMedium
                                  .copyWith(color: AppPallete.accentBlackColor),
                            ),
                          ],
                        ),
                      ),
                      Switch(
                        value: false, onChanged: (value) {},

                        inactiveThumbColor:
                            Colors.white, // Thumb color when OFF
                        inactiveTrackColor:
                            Colors.grey.shade300, // Track color when OFF
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Enable this option if the gym operates 24/7 without specific opening hours. If disabled, you must set the daily opening and closing times.',
                          style: TextStyles
                              .fontCircularSpotify10darkGreyColorRegular
                              .copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Gym Operating Hours',
                          style: TextStyles.fontCircularSpotify16BlackMedium
                              .copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Set your gym’s weekly schedule to help users know when to visit.',
                          style: TextStyles
                              .fontCircularSpotify10darkGreyColorRegular
                              .copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                ],
              ),
              SizedBox(width: 296.7.w, child: DaysContainer())
            ],
          ),
        ),
      ],
    );
  }
}
