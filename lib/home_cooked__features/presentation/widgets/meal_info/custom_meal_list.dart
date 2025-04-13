import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/common/widget/main_loader.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/utils/alert_dialog_utils.dart';
import 'package:kamn/home_cooked__features/data/models/meals_model.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/meal_review_cubit/meal_cubit.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/meal_review_cubit/meal_state.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_meal_deatils.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_tags.dart';

class CustomMealList extends StatelessWidget {
  const CustomMealList({
    super.key,
    required this.cubit,
  });

  final MealCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MealCubit, MealState>(
      builder: (context, state) {
        if (state.isLoading || state.isInitial) {
          return const MainLoader();
        } else if (state.isError) {
          print("erorrrr: ${state.error}");
          return Center(
            child: Text(
              "${state.error}",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          );
        } else if (state.myMeals == null || state.myMeals!.isEmpty) {
          return const Center(
            child: Text(
              "Oops, No Meals Found",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          );
        } else {
          return SizedBox(
              height: 300.h,
              child: ListView.builder(
                itemCount: cubit.state.myMeals!.length,
                itemBuilder: (context, index) {
                  final meal = cubit.state.myMeals![index];
                  final bool isSelected = meal == cubit.state.selectedMeal;
                  return SizedBox(
                    width: double.infinity,
                    child: custom_meal_item(meal: meal, isSelected: isSelected),
                  );
                },
              ));
        }
      },
      listener: (BuildContext context, MealState state) {
        if (state.isDeleteMealError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Oops, Error Deleting Meal${state.error}",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          );
        }
        if (state.isMealImageLoading) {
          AlertDialogUtils.showAlert(
            context: context,
            content: "loading",
            title: "loading",
          );
        } else if (state.isUpdateMealSuccess) {
          AlertDialogUtils.showAlert(
            context: context,
            content: "image uploaded successfully",
            title: "Success",
          );
        } else if (state.isMealImageError ||
            state.isDeleteMealError ||
            state.isUpdateMealError) {
          AlertDialogUtils.showAlert(
            context: context,
            content: state.error ?? "Error",
            title: "Error",
            firstbutton: "OK",
          );
        }
      },
    );
  }
}

class custom_meal_item extends StatelessWidget {
  const custom_meal_item({
    super.key,
    required this.meal,
    required this.isSelected,
  });
  final bool isSelected;
  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<MealCubit>().selectedMeal(meal);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        width: 303.w,
        height: 120.h,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: AppPallete.ofWhiteColor4,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? AppPallete.lightGreenColor : AppPallete.grey,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //taags   and crud btns
            CustomTags(meal: meal),

            verticalSpace(1),
            CustomMealDetails(meal: meal),
          ],
        ),
      ),
    );
  }
}
