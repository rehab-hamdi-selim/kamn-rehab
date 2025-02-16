import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/playground_feature/admin/presentation/widgets/second_page/custom_analytics_chart_data.dart';

class CustomAnalyticsChart extends StatelessWidget {
  const CustomAnalyticsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.79,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.61.r)),
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
                        color: AppPallete.ligtGreyColor.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(12.r)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.h, vertical: 7.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.filter_alt_outlined,
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
                Icon(
                  Icons.more_vert,
                  size: 12.87.h,
                ),
              ],
            ),
            verticalSpace(4.h),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppPallete.lightBlueColor2,
                      borderRadius: BorderRadius.circular(20.r)),
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
            const CustomAnalyticsChartData(),
            verticalSpace(7.h),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppPallete.ligtGreyColor.withOpacity(0.25),
                  ),
                  borderRadius: BorderRadius.circular(9.9.r)),
              padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 8.w),
              child: Text(
                'more',
                style: TextStyles.fontInter8BlackRegular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
