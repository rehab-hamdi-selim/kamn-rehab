import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/home_cooked__features/data/models/tabs_model.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/meal_review_cubit/meal_cubit.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/circular_back_button.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_back_button.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_container.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_container_meal_images.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_meal_list.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_next_button.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_weekly_meal.dart';

class MealInfoScreen extends StatelessWidget {
  MealInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MealCubit>();

    return Scaffold(
      backgroundColor: AppPallete.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          child: SingleChildScrollView(
            // child: SizedBox(
            //   height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHeaderMeal(),

                // CustomTabContainer(
                //   tabNames: tabNames,
                // ),
                SizedBox(height: 19.h),

                Center(child: CustomContainer(mealCubit: cubit)),
                SizedBox(height: 10.h),
                CustomContainerMealImages(
                  mealCubit: cubit,
                ),
                SizedBox(height: 20.h),

                /// const meal

                CustomWeeklyMeal(),

                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      child: CustomBackButton(
                        text: 'Back',
                        icons: Icons.arrow_back_ios,
                        color: AppPallete.ofWhiteColor,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Flexible(
                      child: CustomNextButton(
                        ontap: () {},
                        text: 'Next',
                        icons: Icons.arrow_forward_ios,
                        color: AppPallete.accentBlackColor,
                      ),
                    ),
                  ],
                ),
                // Expanded(
                //   child: ListView(
                //     children: [

                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomHeaderMeal extends StatelessWidget {
  const CustomHeaderMeal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircularBackButton(),
        SizedBox(
          height: 20.h,
        ),
        Text(
          'Add Home Cook Data',
          style: TextStyles.fontCircularSpotify21AccentBlackColorMedium,
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          'Set Up Your Home Cook Profile',
          style: TextStyles.fontCircularSpotify13DarkGreyColorrRegular,
        ),
        SizedBox(height: 19.h),
      ],
    );
  }
}
