import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/searching_of_ui/custom_popular_food_grid_card.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/searching_of_ui/custom_resturants_list.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/searching_of_ui/custom_search_appbar.dart';
import 'package:kamn/core/const/constants.dart';

import '../../../core/theme/app_pallete.dart';

class SearchingUiScreen extends StatelessWidget {
  const SearchingUiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Appbar
            const CustomSearchAppbar(),
            verticalSpace(10.h),
            Text(
              Constants.popularFood,
              style: TextStyles.fontCircularSpotify21BlackRegular,
            ),
            verticalSpace(10.h),

            // Popular Food Grid with background gradient
            SizedBox(
              height: 400.h,
              child: Stack(
                children: [
                  // Background gradient that doesn't scroll
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const RadialGradient(
                          radius: 0.6,
                          colors: AppPallete.radialGradientForSearchUi,
                        ),
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                    ),
                  ),
                  // Scrollable content on top
                  const SingleChildScrollView(child: CustomPopularFoodGrid()),
                ],
              ),
            ),
            verticalSpace(12.h),

            Text(
              Constants.openRestaurants,
              style: TextStyles.fontCircularSpotify21BlackRegular,
            ),
            verticalSpace(10.h),

            // Resturants
            const Expanded(child: CustomResturantsList()),
          ],
        ),
      ),
    );
  }
}
