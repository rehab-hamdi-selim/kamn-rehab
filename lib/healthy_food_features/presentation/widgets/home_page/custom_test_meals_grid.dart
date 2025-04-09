import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/data/models/test_meal_model.dart';

class CustomTestMealsGrid extends StatelessWidget {
  final List<TestMealModel> meals;
  final bool isLoading;

  const CustomTestMealsGrid({
    super.key,
    required this.meals,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (meals.isEmpty) {
      return const Center(
        child: Text('No meals found'),
      );
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 0.75,
      ),
      itemCount: meals.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final meal = meals[index];
        return _buildMealCard(context, meal);
      },
    );
  }

  Widget _buildMealCard(BuildContext context, TestMealModel meal) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
            child: Image.network(
              meal.imageUrls.first,
              height: 120.h,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 120.h,
                width: double.infinity,
                color: Colors.grey.shade300,
                child: const Icon(Icons.error_outline),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.name,
                  style: TextStyles.fontCircularSpotify14BlackRegular,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(
                      Icons.local_fire_department,
                      size: 14.h,
                      color: AppPallete.darkGreenColor,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '${meal.calories} cal',
                      style: TextStyles.fontCircularSpotify10BlackRegular,
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      Icons.access_time,
                      size: 14.h,
                      color: AppPallete.darkGreenColor,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '${meal.prepTime} min',
                      style: TextStyles.fontCircularSpotify10BlackRegular,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${meal.price.toStringAsFixed(2)}',
                      style:
                          TextStyles.fontCircularSpotify14BlackRegular.copyWith(
                        color: AppPallete.darkGreenColor,
                      ),
                    ),
                    Container(
                      width: 28.w,
                      height: 28.h,
                      decoration: const BoxDecoration(
                        color: AppPallete.lightGreenBackground,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: AppPallete.darkGreenColor,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
