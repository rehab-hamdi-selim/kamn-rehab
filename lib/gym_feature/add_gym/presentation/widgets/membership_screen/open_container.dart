import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/membership_offer/membership_offer_cubit.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/membership_offer/membership_offer_state.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/membership_screen/custom_switch.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/membership_screen/days_of_week_selector.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              BlocBuilder<MembershipOfferCubit, MembershipOfferState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Open 24/7',
                                  style: TextStyles
                                      .fontCircularSpotify16BlackMedium
                                      .copyWith(
                                          color: AppPallete.accentBlackColor),
                                ),
                              ],
                            ),
                          ),
                          CustomSwitch(
                            value: state.is247Days!,
                            onTap: (){
                              context.read<MembershipOfferCubit>().toggle247Days();
                            },
                          ),
                        ],
                      ),
                      verticalSpace(4),
                      Text(
                          'Enable this option if the gym operates 24/7 without specific opening hours. If disabled, you must set the daily opening and closing times.',
                          style: TextStyles
                              .fontCircularSpotify10darkGreyColorRegular
                              .copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                          softWrap: true),
                      if (!state.is247Days!) ...[
                        verticalSpace(12),
                        Text(
                          'Gym Operating Hours',
                          style: TextStyles.fontCircularSpotify16BlackMedium
                              .copyWith(color: AppPallete.accentBlackColor),
                        ),
                        Text(
                          'Set your gym’s weekly schedule to help users know when to visit.',
                          style: TextStyles
                              .fontCircularSpotify10darkGreyColorRegular
                              .copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const DaysOfWeekSelector(),
                      ]
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
