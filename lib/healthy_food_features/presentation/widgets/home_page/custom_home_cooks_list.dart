import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/healthy_food_features/data/models/food_item_model.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/home_page/custom_home_cooks.dart';

class CustomHomeCooksList extends StatelessWidget {
  const CustomHomeCooksList({super.key, required this.foodItems});

  final List<FoodItem> foodItems;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: foodItems.length,
      scrollDirection: Axis.horizontal,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1.h,
        mainAxisSpacing: 10.w,
        crossAxisSpacing: 20.h,
      ),
      itemBuilder: (context, index) {
        final foodItem = foodItems[index];
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 30,
          ),
          child: CustomHomeCooks(
            foodItem: foodItem,
          ),
        );
      },
    );
  }
}
