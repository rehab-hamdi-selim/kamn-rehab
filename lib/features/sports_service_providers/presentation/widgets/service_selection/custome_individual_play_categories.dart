import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/add_service_provider/add_service_provider_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider_grounds/service_provider_grounds_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/service_selection/custome_sport_category.dart';

class CustomeIndividualPlayCategories extends StatelessWidget {
  const CustomeIndividualPlayCategories({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<AddServiceProviderCubit>().viewModel;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15.h),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: AppPallete.lightGrayColor,
          borderRadius: BorderRadius.circular(20.h)),
      child: SizedBox(
        height: 215.h,
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: viewModel.individualSportList.length,
          separatorBuilder: (context, index) => verticalSpace(10.h),
          itemBuilder: (context, index) {
            final category = viewModel.individualSportList[index];
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
