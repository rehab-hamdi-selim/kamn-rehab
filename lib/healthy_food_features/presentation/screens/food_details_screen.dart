import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/healthy_food_features/data/models/test_meal_model.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/food_details/custom_details_text.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/food_details/custom_ingrediants_food.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/food_details/custom_rating_row.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/food_details/custom_restaurant_badge.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/food_details/custom_text.dart';

import '../widgets/food_details/custom_order_section.dart';

class FoodDetailsScreen extends StatefulWidget {
  final TestMealModel meal;

  const FoodDetailsScreen({
    super.key,
    required this.meal,
  });

  @override
  _FoodDetailsScreenState createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Stack(
              children: [
                CarouselSlider(
                  items: widget.meal.imageUrls.map((imageUrl) {
                    return ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(30.r)),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/food.png',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          );
                        },
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 300.h,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1.0,
                  ),
                ),
                Positioned(
                  top: 40.h,
                  left: 16.w,
                  child: _iconButton(Icons.arrow_back,
                      () => Navigator.pop(context), Colors.white, Colors.black),
                ),
                Positioned(
                  top: 200.h,
                  right: 16.w,
                  child: _iconButton(
                      liked ? Icons.favorite : Icons.favorite_border, () {
                    setState(() {
                      liked = !liked; // اعمل Toggle بين Like و Unlike
                    });
                  }, liked ? Colors.red : Colors.black, Colors.white),
                ),
              ],
            ),
          ),

          ////////////
          ///////////
          Positioned(
            top: 250.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.r),
                topRight: Radius.circular(50.r),
              ),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h),
                      const CustomRestaurantBadge(),
                      SizedBox(height: 16.h),
                      CustomText(widget.meal.name, 24.sp, FontWeight.bold),
                      SizedBox(height: 8.h),
                      const CustomRatingRow(),
                      SizedBox(height: 16.h),
                      CustomText(
                          Constants.detailsTitle, 18.sp, FontWeight.bold),
                      SizedBox(height: 8.h),
                      CustomDetailsText(text: widget.meal.details),
                      SizedBox(height: 16.h),
                      CustomText(
                          Constants.ingredientsTitle, 18.sp, FontWeight.bold),
                      SizedBox(height: 8.h),
                      CustomIngredients(ingredients: widget.meal.ingredients),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            child: CustomOrderSection(
              price: widget.meal.price,
              meal: widget.meal,
            ),
          )
        ],
      ),
    );
  }

  Widget _iconButton(IconData icon, VoidCallback onPressed, Color color,
      Color backgroundColor) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      child: IconButton(icon: Icon(icon, color: color), onPressed: onPressed),
    );
  }
}
