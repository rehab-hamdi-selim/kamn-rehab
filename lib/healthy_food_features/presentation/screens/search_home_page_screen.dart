import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/const/icon_links.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/home_page/custom_categories_list.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/home_page/custom_search_bar.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/home_page/rounded_border_button.dart';

import '../../data/models/food_item_model.dart';

class SearchingOfHomePageScreen extends StatelessWidget {
  const SearchingOfHomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    child: SvgPicture.asset(
                      height: 15,
                      IconLinks.arrow,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  const Expanded(
                    child: CustomSearchBar(
                      hintText: 'search...',
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    width: 46.w,
                    height: 46.h,
                    decoration: const ShapeDecoration(
                      color: AppPallete.lightGreenBackground,
                      shape: OvalBorder(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        IconLinks.slidersHorizontal,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                'Recent Keywords',
                style: TextStyles.fontCircularSpotify20AccentBlackMedium,
              ),
              SizedBox(height: 21.h),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  final List<String> buttonTexts = [
                    'grill',
                    'fruit',
                    'Carb',
                    'KETO',
                    'Protein',
                    'Chicken',
                  ];
                  return Flexible(
                    child: RoundedBorderButton(
                      text: buttonTexts[index],
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              Text(
                'Trending food',
                style: TextStyles.fontCircularSpotify20AccentBlackMedium,
              ),
              SizedBox(
                height: 280.h,
                child: const CustomCategoriesList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
