import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/searching_of_ui/custom_popular_food_grid_card.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/searching_of_ui/custom_resturants_list.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/searching_of_ui/custom_search_appbar.dart';

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
            CustomSearchAppbar(),
            verticalSpace(10.h),
            Text(
              "Popular food",
              style: TextStyles.fontCircularSpotify21BlackRegular,
            ),
            verticalSpace(10.h),

            // Popular Food Grid (with defined height)
            SizedBox(
              height: 350.h,
              child: SingleChildScrollView(child: CustomPopularFoodGridCard()),
            ),
            verticalSpace(12.h),

            Text(
              "Open Restaurants",
              style: TextStyles.fontCircularSpotify21BlackRegular,
            ),
            verticalSpace(10.h),

            // Wrap ListView.builder inside Expanded
            CustomResturantsList(),
          ],
        ),
      ),
    );
  }
}
