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
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: AppPallete.whiteColor,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 21.w, top: 20.h),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 40.h,
                height: 40.w,
                decoration: BoxDecoration(
                    color: const Color(0xffE9E9E9),
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.bar_chart,
                ),
              ),
            ),
          ),
          Text(
            'Expacted Earning',
            style: TextStyles.font14RobotoLightBlackColorRegular,
          ),
          verticalSpace(9.31),
          Text(
            '\$620',
            style: TextStyles.fontRoboto26BoldBlack,
          ),
          verticalSpace(9.31),
          Container(
            height: 27.92.h,
            width: 67.w,
            decoration: BoxDecoration(
                color: AppPallete.blueColor,
                borderRadius: BorderRadius.circular(30)),
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
    );
  }
}
