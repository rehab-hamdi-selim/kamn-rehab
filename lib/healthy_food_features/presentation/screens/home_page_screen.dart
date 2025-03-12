import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/const/icon_links.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/data/models/category_data.dart';
import 'package:kamn/healthy_food_features/data/models/food_item_model.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/home_page/custom_categories_list.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/home_page/custom_search_bar.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/home_page/view_more_button.dart';

import '../../../core/const/image_links.dart';
import '../../../core/theme/app_pallete.dart';
import '../widgets/home_page/custom_app_bar.dart' show CustomAppBar;
import '../widgets/home_page/custom_home_cooks_list.dart';
import '../widgets/home_page/custom_resturants_list.dart';
import '../widgets/home_page/custom_tab_bar.dart';

class HomePageHealthyFoodScreen extends StatefulWidget {
  const HomePageHealthyFoodScreen({super.key});

  @override
  State<HomePageHealthyFoodScreen> createState() =>
      _HomePageHealthyFoodScreenState();
}

class _HomePageHealthyFoodScreenState extends State<HomePageHealthyFoodScreen> {
  final List<Category> categories = [
    Category(name: "All", icon: "", foodItems: []),
    Category(name: "Chicken", icon: IconLinks.chicken, foodItems: []),
    Category(name: "Vegan", icon: IconLinks.vegan, foodItems: []),
    Category(name: "Meat", icon: IconLinks.meat, foodItems: []),
  ];

  List<FoodItem> trendingFoods = [
    FoodItem(
      name: "Fruit Salad",
      imageUrl: "assets/images/salad_1.png",
      price: 150.0,
      calories: 250,
      rating: 4.7,
      tags: ["Healthy", "Low-Carb"],
      restaurantName: "Sarah's House",
      deliveryTime: 30,
    ),
    FoodItem(
      name: "Fruit Salad",
      imageUrl: "assets/images/salad_1.png",
      price: 150.0,
      calories: 250,
      rating: 4.7,
      tags: ["Healthy", "Low-Carb"],
      restaurantName: "Sarah's House",
      deliveryTime: 30,
    ),
    FoodItem(
      name: "Chicken Salad",
      imageUrl: "assets/images/salad_1.png",
      price: 250.0,
      calories: 150,
      rating: 4.8,
      tags: ["Protein", "Keto"],
      restaurantName: "FitFuel Restaurant",
      deliveryTime: 25,
    ),
  ];

  List<FoodItem> homeCooks = [
    FoodItem(
      name: "Grilled Chicken Salad",
      imageUrl: "assets/images/homCookiesTest.png",
      price: 150.0,
      calories: 500,
      rating: 4.8,
      tags: ["Low-Carb", "Paleo"],
      restaurantName: "Sarah's Kitchen",
      deliveryTime: 40,
    ),
    FoodItem(
      name: "Grilled Chicken Salad",
      imageUrl: "assets/images/homCookiesTest.png",
      price: 150.0,
      calories: 500,
      rating: 4.8,
      tags: ["Low-Carb", "Paleo"],
      restaurantName: "Sarah's Kitchen",
      deliveryTime: 40,
    ),
    FoodItem(
      name: "Grilled Chicken Salad",
      imageUrl: "assets/images/homCookiesTest.png",
      price: 150.0,
      calories: 500,
      rating: 4.8,
      tags: ["Low-Carb", "Paleo"],
      restaurantName: "Sarah's Kitchen",
      deliveryTime: 40,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.lightWiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const CustomAppBar(),
            SizedBox(height: 32.h),
            Row(
              children: [
                const Expanded(
                  child: CustomSearchBar(
                    hintText: 'search...',
                  ),
                ),
                SizedBox(width: 16.w),
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
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyles.fontCircularSpotify20AccentBlackMedium,
                ),
                ViewMoreButton(
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 16.h),
            CustomTabBar(categories: categories),
            SizedBox(
              height: 280.h,
              child: CustomCategoriesList(
                foodItems: trendingFoods,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      ImageLinks.ellips,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Home Cooks',
                      style: TextStyles.fontCircularSpotify20AccentBlackMedium,
                    ),
                  ],
                ),
                ViewMoreButton(
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 250.h,
              child: CustomHomeCooksList(
                foodItems: homeCooks,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Restaurants',
                  style: TextStyles.fontCircularSpotify20AccentBlackMedium,
                ),
                Row(
                  children: [
                    Text(
                      'View more',
                      textAlign: TextAlign.center,
                      style: TextStyles.fontCircularSpotify12BlackRegular,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: AppPallete.darkGreenColor,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            SizedBox(
              height: 200.h,
              child: CustomResturantsList(),
            ),
          ],
        ),
      ),
    );
  }
}
