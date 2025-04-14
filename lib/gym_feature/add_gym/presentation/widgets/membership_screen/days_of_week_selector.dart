import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_gym_button.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/membership_offer/membership_offer_cubit.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/membership_offer/membership_offer_state.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/membership_screen/custom_time_dropdown.dart';

class DaysOfWeekSelector extends StatefulWidget {
  const DaysOfWeekSelector({super.key});

  @override
  State<DaysOfWeekSelector> createState() => _DaysOfWeekSelectorState();
}

class _DaysOfWeekSelectorState extends State<DaysOfWeekSelector> {
  final List<String> daysOfWeek = [
    'Sat',
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: AppPallete.witeColorShade,
              width: 0.5,
            ),
          ),
          child: BlocBuilder<MembershipOfferCubit, MembershipOfferState>(
            builder: (context, state) {
              return Row(
                mainAxisSize: MainAxisSize.max,
                children: daysOfWeek.map((day) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context
                            .read<MembershipOfferCubit>()
                            .addSelectedDay(day);
                      },
                      child: Container(
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.horizontal(
                            left: daysOfWeek.indexOf(day) == 0
                                ? Radius.circular(8.r)
                                : Radius.zero,
                            right:
                                daysOfWeek.indexOf(day) == daysOfWeek.length - 1
                                    ? Radius.circular(8.r)
                                    : Radius.zero,
                          ),
                          border: const Border(
                            right: BorderSide(
                              color: AppPallete.witeColorShade,
                              width: 0.5,
                            ),
                          ),
                          color: state.isSelected(day)
                              ? AppPallete.lightGreenColor.withOpacity(0.3)
                              : AppPallete.whiteColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              day,
                              style: TextStyles
                                  .fontCircularSpotify12RegularDarkGreyColor
                                  .copyWith(
                                color: state.isSelected(day)
                                    ? AppPallete.greenColor
                                    : AppPallete.darkGrayColor,
                              ),
                            ),
                            verticalSpace(4),
                            if (state.isSelected(day))
                              Icon(
                                Icons.check_circle,
                                color: AppPallete.greenColor,
                                size: 12.r,
                              )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
        verticalSpace(16),
        // Time selector section
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 110.w,
                  child: CustomTimeDropdown(
                    onChanged:
                        context.read<MembershipOfferCubit>().updateStartTime,
                    title: "Start time",
                  ),
                ),
                SizedBox(
                  width: 110.w,
                  child: CustomTimeDropdown(
                    onChanged:
                        context.read<MembershipOfferCubit>().updateEndTime,
                    title: "End time",
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<MembershipOfferCubit>().addInterval();
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70.r),
                    ),
                    elevation: 4,
                  ),
                  child: Text('Add Time',
                      style: TextStyles.circularSpotify10BoldWhite),
                ),
              ],
            ),
            verticalSpace(12),
            BlocBuilder<MembershipOfferCubit, MembershipOfferState>(
              builder: (context, state) {
                if (state.intervals == null) {
                  return const SizedBox.shrink();
                }
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.intervals!.length,
                    itemBuilder: (context, index) {
                      final interval = state.intervals![index];
                      return Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 8.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: AppPallete.whiteColor,
                          borderRadius: BorderRadius.circular(25.r),
                          border: Border.all(
                            color: AppPallete.witeColorShade,
                            width: 0.5,
                          ),
                        ),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 8.w,
                          runSpacing: 8.h,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              decoration: BoxDecoration(
                                color: AppPallete.ofWhiteColor,
                                borderRadius: BorderRadius.circular(15.r),
                                border: Border.all(
                                  color: AppPallete.darkGreyColor,
                                  width: 0.2,
                                ),
                              ),
                              child: Text(
                                interval.days.join(' & '),
                                style: TextStyles
                                    .fontCircularSpotify10BlackRegular,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/sun.svg',
                                  width: 12.w,
                                  height: 12.h,
                                  color: AppPallete.accentBlackColor,
                                ),
                                horizontalSpace(2),
                                Text(
                                  interval.start.format(context),
                                  style:
                                      TextStyles.fontCircularSpotify10BlackBold,
                                ),
                                horizontalSpace(4),
                                Icon(Icons.arrow_forward,
                                    size: 16.r,
                                    color: AppPallete.accentBlackColor),
                                horizontalSpace(4),
                                SvgPicture.asset(
                                  'assets/icons/moon.svg',
                                  width: 12.w,
                                  height: 12.h,
                                  color: AppPallete.accentBlackColor,
                                ),
                                horizontalSpace(2),
                                Text(
                                  interval.end.format(context),
                                  style:
                                      TextStyles.fontCircularSpotify10BlackBold,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    });
              },
            ),
            verticalSpace(5),
            BlocBuilder<MembershipOfferCubit, MembershipOfferState>(
              builder: (context, state) {
                if (state.selectedDays == null || state.selectedDays!.isEmpty) {
                  return const SizedBox.shrink();
                }
                return Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: AppPallete.whiteColor,
                    borderRadius: BorderRadius.circular(25.r),
                    border: Border.all(
                      color: AppPallete.witeColorShade,
                      width: 0.5,
                    ),
                  ),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8.w,
                    runSpacing: 8.h,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        decoration: BoxDecoration(
                          color: AppPallete.ofWhiteColor,
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(
                            color: AppPallete.darkGreyColor,
                            width: 0.2,
                          ),
                        ),
                        child: Text(
                          state.selectedDays!.join(' & '),
                          style: TextStyles.fontCircularSpotify10BlackRegular,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/sun.svg',
                            width: 12.w,
                            height: 12.h,
                            color: AppPallete.accentBlackColor,
                          ),
                          horizontalSpace(2),
                          Text(
                            state.is24Hours
                                ? '00:00'
                                : state.startTime?.format(context) ?? '',
                            style: TextStyles.fontCircularSpotify10BlackBold,
                          ),
                          horizontalSpace(4),
                          Icon(Icons.arrow_forward,
                              size: 16.r, color: AppPallete.accentBlackColor),
                          horizontalSpace(4),
                          SvgPicture.asset(
                            'assets/icons/moon.svg',
                            width: 12.w,
                            height: 12.h,
                            color: AppPallete.accentBlackColor,
                          ),
                          horizontalSpace(2),
                          Text(
                            state.is24Hours
                                ? '23:59'
                                : state.endTime?.format(context) ?? '',
                            style: TextStyles.fontCircularSpotify10BlackBold,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            verticalSpace(12),
            Row(
              spacing: 8.w,
              children: [
                SizedBox(
                  width: 24.w,
                  height: 24.h,
                  child:
                      BlocBuilder<MembershipOfferCubit, MembershipOfferState>(
                    builder: (context, state) {
                      return Checkbox(
                        value: state.is24Hours,
                        activeColor: AppPallete.blackColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        side: const BorderSide(
                          color: AppPallete.lightGreyColor,
                          width: 1,
                        ),
                        onChanged: (value) {
                          context
                              .read<MembershipOfferCubit>()
                              .toggle24Hours(value!);
                          // Handle checkbox change here
                        },
                      );
                    },
                  ),
                ),
                Text(
                  'Open 24 hours',
                  style: TextStyles.fontCircularSpotify10BlackRegular,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
