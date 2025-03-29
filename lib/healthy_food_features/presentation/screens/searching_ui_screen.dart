import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/searching_of_ui/custom_popular_food_grid_card.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/searching_of_ui/custom_resturants_list.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/searching_of_ui/custom_search_appbar.dart';
import 'package:kamn/core/const/constants.dart';

class SearchingUiScreen extends StatelessWidget {
  const SearchingUiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Appbar
            CustomSearchAppbar(),
            verticalSpace(24.h),
            Text(
              Constants.popularFood,
              style: TextStyles.fontCircularSpotify21BlackRegular,
            ),
            verticalSpace(10.h),

            // Popular Food Grid
            SizedBox(
              height: 202.h,
              child: SingleChildScrollView(child: CustomPopularFoodGridCard()),
            ),
            verticalSpace(12.h),

            Text(
              Constants.openRestaurants,
              style: TextStyles.fontCircularSpotify21BlackRegular,
            ),
            verticalSpace(10.h),

            // Resturants
            CustomResturantsList(),
          ],
        ),
      ),
    );
  }
}
