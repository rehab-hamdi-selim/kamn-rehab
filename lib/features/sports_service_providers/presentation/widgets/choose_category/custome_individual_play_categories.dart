import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider_grounds/service_provider_grounds_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider_grounds/service_provider_grounds_state.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/choose_category/custome_sport_category.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/choose_category/custome_team_play_categories.dart';

class CustomeIndividualPlayCategories extends StatelessWidget {
  const CustomeIndividualPlayCategories({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ServiceProviderGroundsCubit>();
    return Container(
      height: 240.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15.h),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: AppPallete.lightGrayColor,
          borderRadius: BorderRadius.circular(20.h)),
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cubit.viewModel.individualSportList.length,
          separatorBuilder: (context, index) => verticalSpace(10.h),
          itemBuilder: (context, index) {
            final sport = cubit.viewModel.individualSportList[index];
            return BlocBuilder<ServiceProviderGroundsCubit,
                ServiceProviderGroundsState>(
              builder: (context, state) {
                return CustomeSportCategory(
                    color: sport.color,
                    title: sport.title,
                    servicesNum: state.isSuccess
                        ? state.playgrounds![sport.title]?.length.toString()
                        : null);
              },
            );
          }),
    );
  }
}
