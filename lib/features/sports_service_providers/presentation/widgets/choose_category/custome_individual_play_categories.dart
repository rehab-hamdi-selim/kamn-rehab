import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/choose_category/custome_sport_category.dart';

class CustomeIndividualPlayCategories extends StatelessWidget {
  const CustomeIndividualPlayCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15.h),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: AppPallete.lightGrayColor,
          borderRadius: BorderRadius.circular(20.h)),
      child: Column(
        children: [
          CustomeSportCategory(
            color: AppPallete.voiletteColor,
            title: Constants.skyDiving,
          ),
          verticalSpace(10.h),
          CustomeSportCategory(
            color: AppPallete.lightBlueColor,
            title: Constants.swimming,
          ),
        ],
      ),
    );
  }
}
