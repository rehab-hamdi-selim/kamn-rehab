import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/healthy_food_features/data/models/food_item_model.dart';
import 'package:kamn/healthy_food_features/data/models/test_meal_model.dart';
import 'package:kamn/healthy_food_features/presentation/cubit/test_meals_cubit.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/home_page/custom_home_cooks.dart';

class CustomHomeCooksList extends StatelessWidget {
  CustomHomeCooksList({super.key, required this.foodItem});
  List<FoodItem> foodItem;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestMealsCubit, TestMealsState>(
      builder: (context, state) {
        if (state.status == TestMealsStatus.loading) {
          return SizedBox(
            height: 200.h,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state.status == TestMealsStatus.error) {
          return SizedBox(
            height: 200.h,
            child: Center(
              child: Text(
                'Error: ${state.errorMessage}',
                style: TextStyle(fontSize: 14.sp, color: Colors.red),
              ),
            ),
          );
        } else if (state.status == TestMealsStatus.initial) {
          return SizedBox(height: 200.h);
        }
        return ListView.builder(
          itemCount: state.meals.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: 5.w, top: 16.h),
              child: CustomHomeCooks(
                foodItem: state.meals[index],
              ),
            );
          },
        );
      },
    );
  }
}
