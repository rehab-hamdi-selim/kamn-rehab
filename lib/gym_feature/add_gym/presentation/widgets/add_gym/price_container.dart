import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/headline_with_text_field.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({super.key});

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
              const HeadlineWithTextField(
                headLine: 'Add Pricing',
                subtitle: 'Sets the cost users will pay for the plan.',
                hintText: '2000',
              ),
              const HeadlineWithTextField(
                headLine: 'Free Months (Optional)',
                subtitle:
                    'Attract users with additional value for annual plans.',
                hintText: '0',
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Add Discount ',
                              style: TextStyles.fontCircularSpotify16BlackMedium
                                  .copyWith(color: AppPallete.accentBlackColor),
                            ),
                            TextSpan(
                              text: '(Optional)',
                              style:
                                  TextStyles.fontCircularSpotify12GrayRegular,
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
                      Text(
                        'promotional element to attract new members ',
                        style: TextStyles
                            .fontCircularSpotify10darkGreyColorRegular
                            .copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
