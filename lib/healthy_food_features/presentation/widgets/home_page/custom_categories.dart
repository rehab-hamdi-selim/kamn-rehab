import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/healthy_food_features/data/models/test_meal_model.dart';
import 'package:kamn/healthy_food_features/presentation/screens/food_details_screen.dart';

import '../../../../core/common/cubit/app_user/app_user_cubit.dart';
import '../../../../core/theme/style.dart';

class CustomCategories extends StatelessWidget {
  final String title;
  final String image;
  final String price;
  final String calories;
  final String description;
  final TestMealModel meal;

  const CustomCategories({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.calories,
    required this.description,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<AppUserCubit>().getMealQuantity(meal.id);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetailsScreen(meal: meal),
          ),
        );
      },
      child: Container(
        width: 160.w,
        height: 170.h,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              bottom: 0.h,
              child: Container(
                width: 160.w,
                height: 155.h,
                padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      spreadRadius: 0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      title,
                      style: TextStyles.fontRoboto14LightBlackRegular
                          .copyWith(fontWeight: FontWeight.w700),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      description,
                      style: TextStyles.circularSpotify10LightGrey
                          .copyWith(fontSize: 8),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 0.h),
                    Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '🔥 ',
                                style: TextStyles.circularSpotify10LightGrey,
                              ),
                              TextSpan(
                                text: '$calories kcal',
                                style: TextStyles.circularSpotify10LightGrey,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '$price ',
                                style:
                                    TextStyles.circularSpotify14BoldDarkBlack,
                              ),
                              TextSpan(
                                text: '£GP ',
                                style: TextStyles.circularSpotify10Green,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 60.h,
              child: Container(
                width: 120.w,
                height: 120.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // color: Colors.grey.shade200,
                ),
                child: ClipOval(
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Icon(
                          Icons.restaurant,
                          size: 40.h,
                          color: Colors.grey.shade400,
                        ),
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                          strokeWidth: 2,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
