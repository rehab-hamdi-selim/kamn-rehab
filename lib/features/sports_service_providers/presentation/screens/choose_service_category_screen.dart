import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider_grounds/service_provider_grounds_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider_grounds/service_provider_grounds_state.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/choose_category/custome_individual_play_categories.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/choose_category/custome_team_play_categories.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/choose_category/custome_title_text.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/service_provider_grounds/custom_app_bar_service_provider.dart';

class ChooseServiceCategoryScreen extends StatelessWidget {
  const ChooseServiceCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ServiceProviderGroundsCubit,
        ServiceProviderGroundsState>(
      listener: (context, state) {
        if (state.isFailure) {
          showSnackBar(context, state.erorrMessage!);
        }
      },
      child: Scaffold(
          backgroundColor: AppPallete.whiteColor,
          appBar: CustomAppBarServiceProvider.appBar(
            arrowFunction: () {},
            notificationIconFunction: () {},
            profileFunction: () {},
            badgesIconFunction: () {},
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 25.h, horizontal: 65.w),
                  child: Text(
                    textAlign: TextAlign.center,
                    Constants.whichSportYouServe,
                    style: TextStyles.fontRoboto24MediumBlack,
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
          )),
    );
  }
}
