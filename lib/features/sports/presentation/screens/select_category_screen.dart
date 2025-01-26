import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/common/widget/loader.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_app_bar.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/features/sports/presentation/cubits/select_category_cubit/select_category_cubit.dart';
import 'package:kamn/features/sports/presentation/cubits/select_category_cubit/select_category_state.dart';
import 'package:kamn/features/sports/presentation/widgets/select_category/custome_individual_play_categories.dart';
import 'package:kamn/features/sports/presentation/widgets/select_category/custome_team_play_categories.dart';
import 'package:kamn/features/sports/presentation/widgets/select_category/custome_title_text.dart';

class SelectCategoryScreen extends StatelessWidget {
  const SelectCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SelectCategoryCubit, SelectCategoryState>(
        listener: (context, state) {
      if (state.isError) {
        showSnackBar(context, state.error!);
      }
    }, builder: (context, state) {
      return Scaffold(
          backgroundColor: AppPallete.whiteColor,
          appBar: CustomAppBar.appBar(
            firstScreen: true,
            color: AppPallete.whiteColor,
            context: context,
            notificationIconFunction: () {},
            badgesIconFunction: () {},
          ),
          body:state.isSuccess? SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 25.h, horizontal: 65.w),
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        Constants.chooseYourGame,
                        style: TextStyles.font32BlackColormedium,
                      ),
                    ],
                  ),
                ),
                const CustomeTitleText(
                  title: Constants.teamPlay,
                  type: Constants.fourOrMore,
                ),
                const CustomeTeamPlayCategories(),
                const CustomeTitleText(
                  title: Constants.individualPlay,
                  type: Constants.oneOrMore,
                ),
                const CustomeIndividualPlayCategories(),
              ],
            ),
          ):const Center(child: Loader(),)
          );
    });
  }
}
