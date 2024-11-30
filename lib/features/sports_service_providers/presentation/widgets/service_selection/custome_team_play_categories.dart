import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/service_selection/custome_sport_category.dart';

class CustomeTeamPlayCategories extends StatelessWidget {
  const CustomeTeamPlayCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15.h),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: AppPallete.lightGrayColor,
          borderRadius: BorderRadius.circular(20.h)),
      child: SizedBox(
        height: 400.0.h,
        child: ListView.separated(
          itemCount: SportsCategories.sportsCategories.length,
          separatorBuilder: (context, index) => verticalSpace(10.h),
          itemBuilder: (context, index) {
            final category = SportsCategories.sportsCategories[index];
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

class SportsCategories {
  final String title;
  final Color color;

  SportsCategories({required this.title, required this.color});

  static List<SportsCategories> sportsCategories = [
    SportsCategories(
        title: SportsType.football.name, color: AppPallete.greenColor),
    SportsCategories(
        title: SportsType.basketball.name, color: AppPallete.pinkColor),
    SportsCategories(
        title: SportsType.tennis.name, color: AppPallete.pinkColor),
    SportsCategories(
        title: SportsType.volleyball.name, color: AppPallete.yellowColor),
  ];
}

enum SportsType {
  football,
  basketball,
  tennis,
  volleyball,
}
