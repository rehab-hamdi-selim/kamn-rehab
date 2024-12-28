import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_app_bar.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_cubit.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_state.dart';
import 'package:kamn/features/sports/presentation/widgets/choose_sports_category/custome_individual_play_categories.dart';
import 'package:kamn/features/sports/presentation/widgets/choose_sports_category/custome_team_play_categories.dart';
import 'package:kamn/features/sports/presentation/widgets/choose_sports_category/custome_title_text.dart';

class ChooseSportsCategoryScreen extends StatelessWidget {
  const ChooseSportsCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SportsGroundsCubit, SportsGroundsState>(
        listener: (context, state) {
          if (state.isFailure) {
            showSnackBar(context, state.erorrMessage!);
          }
        },
        child: Scaffold(
            backgroundColor: AppPallete.whiteColor,
            appBar: CustomAppBar.appBar(
              color: AppPallete.whiteColor,
              context: context,
              notificationIconFunction: () {},
              badgesIconFunction: () {},
            ),
            body: SingleChildScrollView(
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
                  CustomeTitleText(
                    title: Constants.teamPlay,
                    type: Constants.fourOrMore,
                  ),
                  const CustomeTeamPlayCategories(),
                  CustomeTitleText(
                    title: Constants.individualPlay,
                    type: Constants.oneOrMore,
                  ),
                  const CustomeIndividualPlayCategories(),
                ],
              ),
            )));
  }
}
