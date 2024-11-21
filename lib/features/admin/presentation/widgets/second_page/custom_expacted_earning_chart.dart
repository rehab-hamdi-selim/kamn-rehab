import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/admin/presentation/widgets/second_page/custom_expacted_earning_chart_data.dart';

class CustomExpactedEarningChart extends StatelessWidget {
  const CustomExpactedEarningChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.91,
      child: Card(
        elevation: 2.79,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.61.r)),
        color: AppPallete.whiteColor,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 21.4.w, top: 20.47.h),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 40.h,
                  height: 40.w,
                  decoration: BoxDecoration(
                      color: AppPallete.whiteGreyColor,
                      borderRadius: BorderRadius.circular(6.51.r)),
                  child: const Icon(
                    Icons.bar_chart,
                  ),
                ),
              ),
            ),
            Text(
              'Expacted Earning',
              style: TextStyles.font13BlackRegular,
            ),
            verticalSpace(9.31.h),
            Text(
              '\$620',
              style: TextStyles.fontRoboto26BoldBlack,
            ),
            verticalSpace(9.31.h),
            Container(
              height: 27.92.h,
              width: 67.w,
              decoration: BoxDecoration(
                  color: AppPallete.blueColor,
                  borderRadius: BorderRadius.circular(30.r)),
              child: Center(
                child: Text(
                  '+2.15%',
                  style: TextStyles.font14White70,
                ),
              ),
            ),
            const CustomExpactedEarningChartData(),
          ],
        ),
      ),
    );
  }
}
