import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_hpme_cook_button.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/add_home_cook/add_home_cook_cubit.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/meal_review_cubit/meal_cubit.dart';
import 'package:kamn/home_cooked__features/presentation/screen/order_options_screen.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/circular_back_button.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_container.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_container_meal_images.dart';
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
                CustomHeaderHomeCook(),

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
                    Flexible(
                      child: CustomCookButton(
                        text: 'Back',
                        onPressed: () {
                          context.read<AddHomeCookCubit>().goToPreviousPage();
                        },
                        isBackButton: true,
                        foregroundColor: AppPallete.blackColor,
                        backgroundColor: AppPallete.ofWhiteColor,
                      ),
                      // child: CustomBackButton(
                      //   text: 'Back',
                      //   icons: Icons.arrow_back_ios,
                      //   color: AppPallete.ofWhiteColor,
                      // ),
                    ),
                    SizedBox(width: 8.w),
                    Flexible(
                      child: CustomNextButton(
                        ontap: () {
                          // cubit.selectedMeal(mealModel);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BlocProvider.value(
                              value: cubit,
                              child: OrderOptionsHomeCookScreen(),
                            ),
                          ));
                        },
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

class CustomHeaderHomeCook extends StatelessWidget {
  const CustomHeaderHomeCook({
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
          style: TextStyles.fontCircularSpotify20AccentBlackMedium,
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          'Set Up Your Home Cook Profile',
          style: TextStyles.fontCircularSpotify14GrayRegular,
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
