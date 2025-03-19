import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/weekday_selector.dart';

class CustomWeeklyMeal extends StatefulWidget {
  const CustomWeeklyMeal({super.key});

  @override
  State<CustomWeeklyMeal> createState() => _CustomWeeklyMealState();
}

class _CustomWeeklyMealState extends State<CustomWeeklyMeal> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320.h,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            width: 0.20.w,
            color: AppPallete.lightGreyColor,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 227.w,
                  child: Text(
                    'Weekly Meal Schedule — Add Meals by Day',
                    style: TextStyles.fontCircularSpotify20AccentBlackMedium,
                  ),
                ),
                const Spacer(),
                Switch(
                  value: isSwitched,
                  onChanged: (value) => setState(() => isSwitched = value),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: const Color(
                    0XFFe0e0e0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            SizedBox(
              width: 303.w,
              child: Text(
                'Organizing your meals by day helps customers plan their orders ahead of time, especially those following strict meal plans.',
                style: TextStyles.fontCircularSpotify13DarkGreyColorrRegular,
              ),
            ),
            Container(),
            SizedBox(height: 10.h),
            const WeekdaySelector(),
            SizedBox(height: 10.h),
            SizedBox(
              width: 295.w,
              child: Text(
                'Save time by assigning this meal to multiple days — perfect for recurring favorites or daily specials.',
                style: TextStyles.fontCircularSpotify13DarkGreyColorrRegular,
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              width: double.infinity,
              height: 40.h,
              padding: const EdgeInsets.all(10.64),
              decoration: ShapeDecoration(
                color: AppPallete.lightGreyColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(69.20.r),
                ),
              ),
              child: Text(
                'Add time',
                style: TextStyles.fontCircularSpotify15lightWiteColorMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
