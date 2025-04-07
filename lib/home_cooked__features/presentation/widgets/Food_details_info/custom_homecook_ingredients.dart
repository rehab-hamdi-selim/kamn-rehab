import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/data/models/category_data.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/meal_review_cubit/meal_cubit.dart';

import 'package:kamn/home_cooked__features/presentation/cubits/meal_review_cubit/meal_state.dart';

class CustomHomecookIngredients extends StatelessWidget {
  final List<Category> ingredients;
  final List<String> selectedIngredients;

  const CustomHomecookIngredients({
    super.key,
    required this.ingredients,
    this.selectedIngredients = const [],
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealCubit, MealState>(
      builder: (context, state) {
        if (ingredients.isEmpty) {
          return const Center(child: Text("No ingredients available"));
        }

        return SingleChildScrollView(
          child: SizedBox(
            height: (ingredients.length / 5).ceil() * 85.h,
            width: double.infinity,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1.1,
                crossAxisSpacing: 4,
                mainAxisSpacing: 10,
              ),
              itemCount: ingredients.length,
              itemBuilder: (context, index) {
                final ingredient = ingredients[index];
                
                // Ensure selected ingredients are fetched correctly
                final isSelected = state.selectedIngredients.contains(ingredient.name);
                //  final isSelected = state.ingredients.contains(ingredient.name);
                //final isSelected = state.selectedIngredients.contains(ingredient.name);
                //final isSelected = selectedIngredients.contains(ingredient.name);
                return _ingredientItem(context, ingredient, isSelected);
              },
            ),
          ),
        );
      },
    );
  }

  Widget _ingredientItem(BuildContext context, Category ingredient, bool isSelected) {
    return InkWell(
      onTap: () => context.read<MealCubit>().toggleSelection(ingredient.name),
      child: SizedBox(
        height: 75.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppPallete.lightGreenBackground
                    : AppPallete.lightGreyBackground,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                ingredient.icon,
                color: isSelected
                    ? AppPallete.lightGreenColor
                    : AppPallete.mediumLightGray,
                width: 24.w,
                height: 24.h,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 5),
            Flexible(
              child: Text(
                ingredient.name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: isSelected
                    ? TextStyles.fontCircularSpotify10GreenRegular
                    : TextStyles.fontCircularSpotify10Gray2Regular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
