import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/admin/presentation/widgets/second_page/custom_analytics_chart_data.dart';

class CustomAnalyticsChart extends StatelessWidget {
  const CustomAnalyticsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: AppPallete.whiteColor,
      child: Padding(
        padding:
            EdgeInsets.only(left: 12.w, top: 11.h, right: 15.w, bottom: 13.h),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Analytics Report',
                  style: TextStyles.font13BlackInterColorSemiBold,
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppPallete.lgGreyColor,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.h, vertical: 7.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.filter_list_alt,
                        color: AppPallete.blackColor,
                        size: 10.h,
                      ),
                      horizontalSpace(7),
                      Text(
                        'Filter',
                        style: TextStyles.fontInter8BlackRegular,
                      ),
                    ],
                  ),
                ),
                horizontalSpace(33.w),
                const Icon(
                  Icons.list,
                  size: 12,
                ),
              ],
            ),
            verticalSpace(4.h),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppPallete.lightBlueColor2,
                      borderRadius: BorderRadius.circular(20)),
                  width: 5.83.w,
                  height: 5.83.h,
                ),
                horizontalSpace(4.w),
                Text(
                  'income',
                  style: TextStyles.fontInter10LightGreySemiBold,
                ),
                horizontalSpace(4.w),
                Container(
                  decoration: BoxDecoration(
                      color: AppPallete.accentBlackColor,
                      borderRadius: BorderRadius.circular(20)),
                  width: 5.83.w,
                  height: 5.83.h,
                ),
                horizontalSpace(4.w),
                Text(
                  'outcome',
                  style: TextStyles.fontInter10LightGreySemiBold,
                ),
              ],
            ),
            verticalSpace(43.h),
            Expanded(child: CustomAnalyticsChartData()),
          ],
        ),
      ),
    );
  }
}
