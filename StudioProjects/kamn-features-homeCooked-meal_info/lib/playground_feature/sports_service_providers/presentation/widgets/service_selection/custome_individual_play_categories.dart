import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/widgets/service_selection/custome_sport_category.dart';

class CustomeIndividualPlayCategories extends StatelessWidget {
  const CustomeIndividualPlayCategories({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15.h),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: AppPallete.ofWhiteColor,
          borderRadius: BorderRadius.circular(20.h)),
      child: SizedBox(
        height: 215.h,
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: Constants.individualSportList.length,
          separatorBuilder: (context, index) => verticalSpace(10.h),
          itemBuilder: (context, index) {
            final category =Constants.individualSportList[index];
            return CustomeSportCategory(
              color: category.color,
              title: category.title,
            );
          },
        ),
      ),
    );
  }
}
