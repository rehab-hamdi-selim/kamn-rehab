import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/const/icon_links.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/theme_data/app_palette.dart';
import 'package:kamn/core/theme_data/style.dart';
import 'package:kamn/core/utils/app_images.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_app_bar.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_bottom.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_filter_properties.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_filter_section.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_text_form_field.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_your_next_match_timer.dart';
import 'package:kamn/features/sports/presentation/widgets/view_reservation_screen.dart/custom_reservation_filter.dart';
import 'package:kamn/features/sports/presentation/widgets/view_reservation_screen.dart/custom_reservation_list.dart';

class ViewResrvationScreen extends StatelessWidget {
  const ViewResrvationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.whiteColor,
      appBar: CustomAppBar.appBar(
        backGroundColor: AppPallete.whiteColor,
        arrowFunction: () {},
        notificationIconFunction: () {},
        profileFunction: () {},
        badgesIconFunction: () {},
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Constants.groundsScreenTitle,
              style: Style.font30DarkGreenColorBold,
            ),
            const CustomReservationFilter(),
            verticalSpace(10),
            // const CustomFilterProperties(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Constants.reservation,
                  style: Style.font15BlackColorBold,
                ),
                Text(
                  Constants.showAll,
                  style: Style.font10GrayColorW400,
                ),
              ],
            ),
            verticalSpace(5.h),
            const CustomYourNextMatchTimer(),
            verticalSpace(20),
            const Expanded(child: CustomReservationList())
          ],
        ),
      ),
    );
  }
}
