import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/const/icon_links.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/data/models/food_item_model.dart';

class CustomHomeCooks extends StatelessWidget {
  const CustomHomeCooks({
    super.key,
    required this.foodItem,
  });

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      child: Stack(
        children: [
          Container(
            width: 160.w,
            height: 260.h,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 160.w,
                      height: 85.h,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: foodItem.imageUrl.isNotEmpty
                              ? AssetImage(foodItem.imageUrl)
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
                      SizedBox(height: 16.h),
                      Text(
                        foodItem.name,
                        style: TextStyles.fontCircularSpotify15MediumBlack,
                      ),
                      SizedBox(height: 4.h),
                      _buildTags(),
                      SizedBox(height: 8.h),
                      _buildCaloriesAndPrice(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
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
          Text(
            foodItem.rating.toString(),
            style: TextStyles.fontCircularSpotify10BlackRegular.copyWith(
              color: Color(0xFF1F1F1F),
            ),
          ),
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
        children: foodItem.tags.map((tag) {
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
                text: '${foodItem.calories} kcal',
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
                text: '${foodItem.price} ',
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
