import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/healthy_food_features/data/models/food_item_model.dart';

import 'custom_categories.dart';

class CustomCategoriesList extends StatelessWidget {
  final List<FoodItem> foodItems;

  const CustomCategoriesList({
    super.key,
    required this.foodItems,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: foodItems.length,
      scrollDirection: Axis.horizontal,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1.53.h,
        crossAxisSpacing: 6.w,
      ),
      itemBuilder: (context, index) {
        final foodItem = foodItems[index];
        return Padding(
          padding: const EdgeInsets.only(
            left: 5,
            right: 5,
            top: 20,
          ),
          child: CustomCategories(
            title: foodItem.name,
            image: foodItem.imageUrl,
            price: foodItem.price.toString(),
            calories: foodItem.calories.toString(),
            description: foodItem.tags.join(", "),
          ),
        );
      },
    );
  }
}
