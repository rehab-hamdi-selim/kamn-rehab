import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_bottom.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../../core/helpers/debouner.dart';
import '../../../../../core/helpers/geolocator_helper.dart';
import '../../../../../core/theme/app_pallete.dart';

// ignore: must_be_immutable
class CustomShowBottomSheetFilter extends StatefulWidget {
  double distance;
  Function applyFilter;
  CustomShowBottomSheetFilter({
    super.key,
    required this.distance,
    required this.applyFilter,
  });

  @override
  State<CustomShowBottomSheetFilter> createState() =>
      _CustomShowBottomSheetFilterState();
}

class _CustomShowBottomSheetFilterState
    extends State<CustomShowBottomSheetFilter> {
  Position? position;
  final _debouncer = Debouncer(milliseconds: 0);
  @override
  Widget build(BuildContext context) {
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
                Text(
                  "${widget.distance.round()} km",
                  style: TextStyles.font13GreenColorsemiBold,
                ),
              ],
            ),
            Slider(
              max: 50,
              min: 0,
              activeColor: AppPallete.greenColor,
              label: widget.distance.round().toString(),
              value: widget.distance,
              onChanged: (value) {
                setState(() {
                  widget.distance = value;
                });
                _debouncer.run(() async {
                  try {
                    position =
                        await GeolocatorHelper.determinePosition(context);
                    print("{position!.latitude}${position!.latitude}");
                  } catch (e) {
                    setState(() {
                      widget.distance = 0;
                    });
                    print("widget.distance  ${widget.distance}");
                  }
                });
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
                // position;
                // if (position == null) {
                //   debugPrint("position is null");
                // }
                widget.applyFilter(
                  distance: widget.distance.round(),
                  latitude: position?.latitude,
                  longitude: position?.longitude,
                );
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
      ),
    );
  }
}
