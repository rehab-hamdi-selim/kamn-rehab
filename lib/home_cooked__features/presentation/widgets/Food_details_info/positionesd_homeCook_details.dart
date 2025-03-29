import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/data/models/category_data.dart';
import 'package:kamn/home_cooked__features/data/models/meals_model.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/meal_review_cubit/meal_cubit.dart' show MealCubit;
import 'package:kamn/home_cooked__features/presentation/widgets/Food_details_info/custom_food_details_footer.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/Food_details_info/custom_food_details_info.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/Food_details_info/custom_homecook_ingredients.dart';
import 'package:kamn/core/const/constants.dart';

class PositionesdHomecookDetails extends StatelessWidget {
  const PositionesdHomecookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 3.h,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 536.h,
        decoration: BoxDecoration(
          color: AppPallete.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45.r),
            topRight: Radius.circular(45.r),
          ),
        ),
        padding: EdgeInsets.all(16.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(7.h),
            Text(
              context.read<MealCubit>().state.selectedMeal!.name??"",
              style: TextStyles.fontCircularSpotify21BlackBold,
            ),
            verticalSpace(10.h),
            fooddetailsInfo(),
            verticalSpace(10.h),
            Text(
              Constants.detailsTitle,
              style: TextStyles.fontCircularSpotify17BlackRegular,
            ),
            verticalSpace(10.h),
            Text(
              fakeMeals[0].details,
              style: TextStyles.fontCircularSpotify14BlackRegular,
              overflow: TextOverflow.ellipsis,
              maxLines: 7,
            ),
            verticalSpace(10.h),
            //**** ingredients */
            Text(
              Constants.ingredients,
              style: TextStyles.fontCircularSpotify17BlackRegular,
            ),
            verticalSpace(10.h),
          CustomHomecookIngredients(ingredients: ingredients,),
         const   Spacer(),
            //**** footer */
         const   CustomFoodDetailsFooter(),
          ],
        ),
      ),
    );
  }
}
