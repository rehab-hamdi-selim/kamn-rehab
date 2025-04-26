import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/const/icon_links.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/data/models/food_item_model.dart';
import 'package:kamn/healthy_food_features/data/models/test_meal_model.dart';
import 'package:kamn/healthy_food_features/presentation/screens/food_details_screen.dart';

class CustomHomeCooks extends StatelessWidget {
  const CustomHomeCooks({
    super.key,
    required this.foodItem,
  });

  final TestMealModel foodItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetailsScreen(meal: foodItem),
          ),
        );
      },
      child: SizedBox(
        width: 160.w,
        height: 180.h,
        child: Stack(
          children: [
            Container(
              width: 160.w,
              height: 180.h,
              decoration: BoxDecoration(
                color: AppPallete.whiteColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppPallete.blackColor.withValues(
                      alpha: 0.1,
                    ),
                    blurRadius: 6,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 160.w,
                        height: 85.h,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: foodItem.imageUrls.isNotEmpty
                                ? NetworkImage(foodItem.imageUrls.first)
                                : AssetImage('assets/placeholder.png'),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -10.h,
                        left: 8.w,
                        child: _buildRating(),
                      ),
                      Positioned(
                        bottom: -10.h,
                        right: 8.w,
                        child: _buildFavoriteIcon(),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Text('Sarah’s Kitchen',
                                style:
                                    TextStyles.fontCircularSpotify8GrayRegular),
                            Spacer(
                              flex: 1,
                            ),
                            SvgPicture.asset('assets/icons/cooking.svg'),
                            Text(
                              foodItem.prepTime.toString() + 'min',
                              style: TextStyles
                                  .fontCircularSpotify16BlackRegular
                                  .copyWith(fontSize: 6),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          foodItem.name,
                          style: TextStyles.fontCircularSpotify12BlackMedium,
                        ),
                        SizedBox(height: 4.h),
                        _buildTags(),
                        SizedBox(height: 5.h),
                        _buildCaloriesAndPrice(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRating() {
    return Container(
      width: 43.24.w,
      height: 19.5.h,
      padding: EdgeInsets.all(3.w),
      decoration: ShapeDecoration(
        color: AppPallete.offWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(99),
        ),
        shadows: [
          BoxShadow(
            color: AppPallete.transparentBlack,
            blurRadius: 16,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text(
          //   foodItems.rating.toString(),
          //   style: TextStyles.fontCircularSpotify10BlackRegular.copyWith(
          //     color: Color(0xFF1F1F1F),
          //   ),
          // ),
          SizedBox(width: 2.w),
          SvgPicture.asset(
            IconLinks.star,
            height: 15.h,
            width: 15.w,
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteIcon() {
    return Container(
      width: 18.w,
      height: 18.h,
      padding: const EdgeInsets.all(3),
      decoration: ShapeDecoration(
        color: Color(0xFFFEFEFE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(99),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 16,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: SvgPicture.asset(
        IconLinks.heart,
        width: 12,
        height: 12,
      ),
    );
  }

  Widget _buildTags() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 6.w,
        children: foodItem.ingredients.map((tag) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: AppPallete.lgWhiteColor,
              borderRadius: BorderRadius.circular(29.23.r),
            ),
            child: Text(
              "🥗$tag",
              style: TextStyles.fontCircularSpotify8AccentBlackRegular,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCaloriesAndPrice() {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '🔥 ',
                style: TextStyles.circularSpotify10LightGrey,
              ),
              TextSpan(
                text: foodItem.calories.toString() + ' kcal',
                style: TextStyles.circularSpotify10LightGrey,
              ),
            ],
          ),
        ),
        Spacer(),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: foodItem.price.toString(),
                style: TextStyles.circularSpotify14BoldDarkBlack,
              ),
              TextSpan(
                text: '£GP ',
                style: TextStyles.circularSpotify10Green,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
