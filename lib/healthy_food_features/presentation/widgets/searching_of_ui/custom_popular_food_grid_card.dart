import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/data/models/food_item_model.dart';

class CustomPopularFoodGrid extends StatelessWidget {
  const CustomPopularFoodGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20.h,
        crossAxisSpacing: 23.w,
        mainAxisExtent: 182.h,
      ),
      itemCount: trendingFoods.length,
      itemBuilder: (context, index) {
        return _buildPopularFoodCard(trendingFoods[index]);
      },
    );
  }

  Widget _buildPopularFoodCard(FoodItem foodItem) {
    return SingleChildScrollView(
        child: Container(
      width: 160.w,
      height: 182.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.0, 0.2, 0.4, 0.6, 0.8],
          colors: [
            Colors.white.withOpacity(0.0), // Fully transparent at top
            Colors.white.withOpacity(0.3), // Slightly visible
            Colors.white.withOpacity(0.6), // More visible
            Colors.white.withOpacity(0.9), // Almost opaque
            Colors.white, // Fully white at bottom
          ],
        ),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image at the top
          SizedBox(
            height: 94.h,
            width: double.infinity,
            child: Center(
              child: Image.asset(
                foodItem.imageUrl,
                height: 120.h,
                width: 142.w,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 40.h,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ),

          // Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "🔥${foodItem.calories} ${Constants.kCal}",
                    style: TextStyles.fontCircularSpotify8StealGrayRegular,
                  ),
                  verticalSpace(2.h),
                  Text(
                    foodItem.name,
                    style: TextStyles.fontCircularSpotify14BlackBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(2.h),
                  Text(
                    foodItem.tags.toString(),
                    style: TextStyles.fontCircularSpotify8StealGrayLight,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  // Price and plus button row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            foodItem.price.toString(),
                            style: TextStyles.fontCircularSpotify14BlackBold,
                          ),
                          horizontalSpace(1.w),
                          Text(
                            Constants.egp,
                            style: TextStyles.fontCircularSpotify14GreenRegular,
                          ),
                        ],
                      ),

                      // Plus button
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          ImageLinks.plusBtn,
                          width: 32.w,
                          height: 32.h,
                          color: AppPallete.blackColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
