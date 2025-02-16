import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme_data/style.dart';
import 'package:kamn/playground_feature/sports/presentation/widgets/grounds_screen/custom_filter_properties.dart';
import 'package:kamn/playground_feature/sports/presentation/widgets/grounds_screen/custom_filter_section.dart';
import 'package:kamn/playground_feature/sports/presentation/widgets/grounds_screen/custom_ground_list.dart';
import '../../../../core/utils/custom_app_bar.dart';
import '../widgets/grounds_screen/custom_grounds_bloc_listner.dart';

class GroundsScreen extends StatelessWidget {
  const GroundsScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomGroundsBlocListner(
      child: Scaffold(
        backgroundColor: AppPallete.whiteColor,
        appBar: CustomAppBar.appBar(
          color: AppPallete.whiteColor,
          context: context,
          notificationIconFunction: () {},
          badgesIconFunction: () {},
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 19.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ZoomIn(
                  animate: true,
                  duration: const Duration(seconds: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Builder(builder: (context) { 
                        return Text(
                          title,
                          style: Style.font30DarkGreenColorBold.copyWith(
                              color: Sport.values
                                  .firstWhere((element) =>
                                      element.displayName == title,orElse: () => Sport.football,)
                                  .sportColor),
                        );
                      }),
                      CustomFilterSection(title: title
                      ,),
                      verticalSpace(10),
                      const CustomFilterProperties(),
                    ],
                  )),
          
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       Constants.reservation,
              //       style: Style.font15BlackColorBold,
              //     ),
              //     Text(
              //       Constants.showAll,
              //       style: Style.font10GrayColorW400,
              //     ),
              //   ],
              // ),
              // verticalSpace(5.h),
              // const CustomYourNextMatchTimer(),
              verticalSpace(20),
              const CustomGroundList(),
            ],
          ),
        ),
      ),
    );
  }
}
