import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/navigation_extension.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme_data/style.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_filter_properties.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_filter_section.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_ground_list.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/custom_app_bar.dart';
import '../widgets/grounds_screen/custom_grounds_bloc_listner.dart';
import '../widgets/grounds_screen/custome_ground_screen_app_bar.dart';

class GroundsScreen extends StatelessWidget {
  const GroundsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGroundsBlocListner(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: AppPallete.whiteColor,
          appBar: CustomGroundScreenAppBar.appBar(
            color: AppPallete.whiteColor,
            context: context,
            notificationIconFunction: () {},
            badgesIconFunction: () {
              context.pushNamed(Routes.notificationsScreen);
            },
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
                        Text(
                          Constants.groundsScreenTitle,
                          style: Style.font30DarkGreenColorBold,
                        ),
                        CustomFilterSection(),
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
      ),
    );
  }
}
