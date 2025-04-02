import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/home_cooked__features/data/models/tabs_model.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/circular_back_button.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_back_button.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_container.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_container_meal_images.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_next_button.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_tab_container.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_weekly_meal.dart';

class MealInfoScreen extends StatefulWidget {
  const MealInfoScreen({super.key});

  @override
  State<MealInfoScreen> createState() => _MealInfoScreenState();
}

class _MealInfoScreenState extends State<MealInfoScreen> {
  final List<TabsName> tabNames = [
    TabsName(
      name: 'Personal Info',
    ),
    TabsName(
      name: 'Location Verify',
    ),
    TabsName(
      name: 'Meal Info',
    ),
    TabsName(
      name: 'Order Options',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircularBackButton(),
              SizedBox(
                height: 27.h,
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
              // CustomTabContainer(
              //   tabNames: tabNames,
              // ),
              SizedBox(height: 19.h),
              Expanded(
                child: ListView(
                  children: [
                    const CustomContainer(),
                    SizedBox(height: 10.h),
                    const CustomContainerMealImages(),
                    SizedBox(height: 20.h),
                    const Expanded(
                      child: CustomWeeklyMeal(),
                    ),
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
                        const Flexible(
                          child: CustomNextButton(
                            text: 'Next',
                            icons: Icons.arrow_forward_ios,
                            color: AppPallete.accentBlackColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
