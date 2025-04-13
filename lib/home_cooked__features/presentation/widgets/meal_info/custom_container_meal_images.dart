import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/image_picker.dart';
import 'package:kamn/home_cooked__features/data/models/meals_model.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/meal_review_cubit/meal_cubit.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/meal_review_cubit/meal_state.dart';
import 'package:kamn/home_cooked__features/presentation/screen/add_meal_pop_up_screen.dart';
import 'package:kamn/home_cooked__features/presentation/screen/edit_meal_pop_up_screen.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_frame.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_meal_list.dart';

class CustomContainerMealImages extends StatelessWidget {
  const CustomContainerMealImages({super.key, required this.mealCubit});
  final MealCubit mealCubit;
  // final List<File?> _images = [null, null, null, null];
  void _openAddMealBottomSheet(BuildContext context, MealCubit cubit) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true, // Allows the bottom sheet to take full height
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        builder: (context) => BlocProvider.value(
              value: cubit,
              child: AddMealPopUpScreen(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CustomFrame(
        width: double.infinity,
        content:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Meal Images',
              style: TextStyles.fontCircularSpotify14BlackRegular),
          Text(
            'Upload a high-quality photo of your meal.\nBright lighting and simple backgrounds work best!',
            style: TextStyles.fontCircularSpotify8AccentBlackRegular,
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 95.h,
            child: BlocBuilder<MealCubit, MealState>(
              builder: (context, state) {
                List<File?> _images = state.mealImages;
                print("imaaaag: ${_images}");

                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _images.length,
                  separatorBuilder: (context, index) => SizedBox(width: 16.w),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => mealCubit.pickImageMeal(index),
                      //_pickImage(index),
                      child: Container(
                        width: 121.w,
                        height: 94.h,
                        decoration: BoxDecoration(
                          color: AppPallete.ofWhiteColor4,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            width: 0.2.w,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        child: _images[index] == null
                            ? CustomStaticImg()
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: Image.file(
                                  _images[index]!,
                                  width: 122.w,
                                  height: 94.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'Introduce Your Meal',
            style: TextStyles.fontCircularSpotify16BlackMedium,
          ),
          Text(
            'Fill in your meal’s name, price, and special details.',
            style: TextStyles.fontCircularSpotify10StealGrayMedium,
          ),
          SizedBox(height: 10.h),
          GestureDetector(
            onTap: () => _openAddMealBottomSheet(context, mealCubit),
            child: Container(
              width: double.infinity,
              height: 42.h,
              padding: const EdgeInsets.all(10.64),
              decoration: ShapeDecoration(
                color: const Color(0xFF0C0C0C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(69.20),
                ),
              ),
              child: Text(
                'Add meal',
                style: TextStyles.fontCircularSpotify10WhiteMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Center(
            child: Text(
              'Meals can be anything you prepare — from breakfast items to special dinners.',
              textAlign: TextAlign.center,
              style: TextStyles.fontCircularSpotify7GreyMedium,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomMealList(cubit: mealCubit),
        ]),
      ),
    );
  }
}

class CustomStaticImg extends StatelessWidget {
  const CustomStaticImg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          ImageLinks.welcomeImg,
          height: 15.h,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: AppPallete.ofWhiteColor4,
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(
              width: 0.3.w,
              color: Colors.grey.shade400,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2.r,
                offset: Offset(0.h, 1.w),
              ),
            ],
          ),
          child: Text(
            'Choose file',
            style: TextStyles.circularSpotify14RegularDarkBlack,
          ),
        ),
      ],
    );
  }
}
