import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/data/models/test_meal_model.dart';
import 'package:kamn/healthy_food_features/presentation/cubit/test_meals_cubit.dart';

import 'custom_categories.dart';

class CustomCategoriesList extends StatefulWidget {
  const CustomCategoriesList({
    super.key,
  });

  @override
  State<CustomCategoriesList> createState() => _CustomCategoriesListState();
}

class _CustomCategoriesListState extends State<CustomCategoriesList> {
  @override
  void initState() {
    super.initState();
    context.read<TestMealsCubit>().getTestMeals();
  }

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
        }

        if (state.status == TestMealsStatus.error) {
          return SizedBox(
            height: 200.h,
            child: Center(
              child: Text(
                'Error: ${state.errorMessage}',
                style: TextStyles.fontCircularSpotify14BlackRegular,
              ),
            ),
          );
        }

        return SizedBox(
          height: 200.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: state.meals.length,
            itemBuilder: (context, index) {
              final meal = state.meals[index];
              return CustomCategories(
                meal: meal,
              );
            },
          ),
        );
      },
    );
  }
}
