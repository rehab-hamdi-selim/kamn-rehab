import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/playground_feature/sports/presentation/cubits/select_category_cubit/select_category_cubit.dart';
import 'package:kamn/playground_feature/sports/presentation/cubits/select_category_cubit/select_category_state.dart';
import 'package:kamn/playground_feature/sports/presentation/widgets/select_category/custome_sport_category.dart';

class CustomeIndividualPlayCategories extends StatelessWidget {
  const CustomeIndividualPlayCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15.h),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: AppPallete.ofWhiteColor,
          borderRadius: BorderRadius.circular(20.h)),
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: Constants.individualSportList.length,
          separatorBuilder: (context, index) => verticalSpace(10.h),
          itemBuilder: (context, index) {
            final sport = Constants.individualSportList[index];
            return BlocBuilder<SelectCategoryCubit, SelectCategoryState>(
              builder: (context, state) {
                return CustomeSportCategory(
                  color: sport.color,
                  title: sport.title,
                  servicesNum: state.isSuccess
                        ? state.playgroundsMap![sport.title]?.length.toString()
                        : null,
                );
              },
            );
          }),
    );
  }
}
