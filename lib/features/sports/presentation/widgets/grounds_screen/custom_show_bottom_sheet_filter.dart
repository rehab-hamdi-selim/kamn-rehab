import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_bottom.dart';

import '../../../../../core/theme/app_pallete.dart';
import '../../cubits/sports_grounds/sports_ground_cubit.dart';
import '../../cubits/sports_grounds/sports_ground_state.dart';

// ignore: must_be_immutable
class CustomShowBottomSheetFilter extends StatefulWidget {
  const CustomShowBottomSheetFilter({
    super.key,
  });

  @override
  State<CustomShowBottomSheetFilter> createState() =>
      _CustomShowBottomSheetFilterState();
}

class _CustomShowBottomSheetFilterState
    extends State<CustomShowBottomSheetFilter> {
  @override
  Widget build(BuildContext context) {
    final SportsGroundsCubit cubit = context.read<SportsGroundsCubit>();

    return Container(
      height: 600.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 22.w).copyWith(top: 30.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.cancel_outlined,
                    color: AppPallete.accentBlackColor,
                    size: 28.h,
                  ),
                ),
                Text(
                  'Filters',
                  style: TextStyles.font20AccentBlackColorBold,
                ),
                Text(
                  'Reset',
                  style: TextStyles.font16DartBlackColorW400
                      .copyWith(color: AppPallete.greyColor),
                ),
              ],
            ),
            verticalSpace(10.h),
            Text(
              "Location",
              style: TextStyles.font20AccentBlackColorMedium,
            ),
            verticalSpace(5.h),
            TextFormField(
              cursorColor: AppPallete.greenColor,
              decoration: customInputDecoration(
                hintText: 'Enter location',
                icon: Icons.location_on_outlined,
              ),
            ),
            verticalSpace(20.h),
            Text(
              "Dates & Time",
              style: TextStyles.font20AccentBlackColorMedium,
            ),
            verticalSpace(5.h),
            TextFormField(
              cursorColor: AppPallete.greenColor,
              decoration: customInputDecoration(
                hintText: 'Enter Dates & Time',
                icon: Icons.calendar_today,
              ),
            ),
            verticalSpace(20.h),
            Text(
              "Price range",
              style: TextStyles.font20AccentBlackColorMedium,
            ),
            verticalSpace(7.h),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    cursorColor: AppPallete.greenColor,
                    decoration: customInputDecoration(
                      hintText: 'min',
                    ),
                  ),
                ),
                horizontalSpace(5.w),
                Expanded(
                  child: TextFormField(
                    cursorColor: AppPallete.greenColor,
                    decoration: customInputDecoration(
                      hintText: 'max',
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Distance",
                  style: TextStyles.font20AccentBlackColorMedium,
                ),
                BlocBuilder<SportsGroundsCubit, SportsGroundsState>(
                  builder: (context, state) {
                    return Text(
                      "${state.distanceFilterValue.round()} km",
                      style: TextStyles.font13GreenColorsemiBold,
                    );
                  },
                ),
              ],
            ),
            BlocBuilder<SportsGroundsCubit, SportsGroundsState>(
              builder: (context, state) {
                return Slider(
                  max: 50,
                  min: 0,
                  activeColor: AppPallete.greenColor,
                  label: state.distanceFilterValue.round().toString(),
                  value: state.distanceFilterValue,
                  onChanged: (value) {
                    cubit.changeLocationFilter(value);
                  },
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "0 km",
                  style: TextStyles.font12GreyRegular,
                ),
                Text(
                  "50 km",
                  style: TextStyles.font12GreyRegular,
                ),
              ],
            ),
            CustomBottom(
              onPressed: () async {
//you can direct call the function from here

                // position;
                // if (position == null) {
                //   debugPrint("position is null");
                // }
                // widget.applyFilter(
                //   distance: widget.distance.round(),
                //   latitude: position?.latitude,
                //   longitude: position?.longitude,
                // );
                Navigator.pop(context);
              },
              textBottom: 'Apply Filter',
              textStyle: TextStyles.font24WhiteColorMedium,
              maxSize: 55,
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration customInputDecoration({
    String? hintText,
    IconData? icon,
  }) {
    return InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        hintText: hintText,
        hintStyle: TextStyles.font12GreyRegular,
        suffixIcon: Icon(
          icon,
          size: 24.h,
          color: AppPallete.greyColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(31.r),
          borderSide: const BorderSide(
            color: AppPallete.greenColor,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(31.r),
          borderSide: const BorderSide(
            color: AppPallete.greenColor,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(31.r),
          borderSide: const BorderSide(
            color: AppPallete.greenColor,
            width: 1.0,
          ),
        ));
  }
}
