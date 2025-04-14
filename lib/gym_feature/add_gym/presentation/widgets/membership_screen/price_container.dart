import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/membership_offer/membership_offer_cubit.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/membership_offer/membership_offer_state.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/membership_screen/custom_date_picker_field.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/membership_screen/custom_discounte_box.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/membership_screen/custom_switch.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/membership_screen/custom_time_picker_field.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/membership_screen/customdiscount__text_field.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/membership_screen/headline_with_text_field.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           HeadlineWithTextField(
            headLine: 'Add Pricing',
            subtitle: 'Sets the cost users will pay for the plan.',
            hintText: 'Enter plan price',
            controller: context.read<MembershipOfferCubit>().priceController,
          ),
          verticalSpace(12),
           HeadlineWithTextField(
            headLine: 'Free Months ',
            optionalText: "(Optional)",
            subtitle: 'Attract users with additional value for annual plans.',
            hintText: '0',
            controller: context.read<MembershipOfferCubit>().freeMonthsController,
          ),
          verticalSpace(12),
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
                      CustomSwitch(
                        value: state.isDiscount!,
                        onTap: () {
                          context.read<MembershipOfferCubit>().toggleDiscount();
                        },
                      ),
                    ],
                  ),
                  verticalSpace(2.5),
                  Text(
                    'promotional element to attract new members ',
                    style: TextStyles.fontCircularSpotify10darkGreyColorRegular
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  if (state.isDiscount!) ...[
                    verticalSpace(12),
                    Row(
                      children: [
                        Expanded(
                          child: CustomDiscountTextField(
                            hintText: '',
                            controller: context.read<MembershipOfferCubit>().discountPercentageController,
                          ),
                        ),
                        horizontalSpace(12),
                         CustomDiscounteBox(
                          price: double.tryParse(context.read<MembershipOfferCubit>().priceController.text) ?? 0.0,
                          discountPercentage: double.tryParse(context.read<MembershipOfferCubit>().discountPercentageController.text) ?? 0.0,
                        )
                      ],
                    ),
                    verticalSpace(12),
                    Text(
                      'Discount Duration',
                      style: TextStyles.fontCircularSpotify16BlackMedium
                          .copyWith(color: AppPallete.accentBlackColor),
                    ),
                    Text(
                      'Set how long this offer will remain active.',
                      style: TextStyles
                          .fontCircularSpotify10darkGreyColorRegular
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    verticalSpace(12),
                     Row(
                      children: [
                        Expanded(child: CustomDatePickerField(hint: "From",onPressedOk: context.read<MembershipOfferCubit>().updatedDiscountStartDate)),
                        SizedBox(width: 12),
                        Expanded(child: CustomDatePickerField(hint: "To",onPressedOk: context.read<MembershipOfferCubit>().updatedDiscountEndDate)),
                      ],
                    ),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
