import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_app_bar.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/widgets/service_selection/custome_individual_play_categories.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/widgets/service_selection/custome_team_play_categories.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/widgets/service_selection/custome_title_text.dart';

class ServiceSelectionScreen extends StatelessWidget {
  const ServiceSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppPallete.whiteColor,
        appBar: CustomAppBar.appBar(
            context: context,
            color: AppPallete.whiteColor,
            notificationIconFunction: () {},
            profileFunction: () {},
            badgesIconFunction: () {},
          ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 65.w),
                child: Text(
                  textAlign: TextAlign.center,
                  Constants.whichSportYouServe,
                  style: TextStyles.fontRoboto24MediumBlack,
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
        ));
  }
}
