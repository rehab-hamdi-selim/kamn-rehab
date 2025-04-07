import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/home_cooked__features/data/models/meals_model.dart';
import 'package:kamn/home_cooked__features/presentation/screens/edit_meal_pop_up_screen.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_container_meal.dart';

class CustomContainerMealImages extends StatefulWidget {
  const CustomContainerMealImages({super.key});

  @override
  State<CustomContainerMealImages> createState() =>
      _CustomContainerMealImagesState();
}

class _CustomContainerMealImagesState extends State<CustomContainerMealImages> {
  final List<File?> _images = [null, null, null, null];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(int index) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _images[index] = File(pickedFile.path);
      });
    }
  }

  List<Meal> fakeMeals = [
    Meal(
      id: '1',
      name: 'Keto Avocado Bowl',
      type: 'Breakfast',
      prepTime: 30,
      calories: 500,
      price: 150.0,
      specialtyTags: ['High-Protein', 'Keto', 'Vegan'],
      ingredients: ['Avocado', 'Salt', 'Chicken', 'Garlic', 'Chili Pepper'],
      details:
          'A delicious and nutritious keto-friendly avocado bowl, perfect for a low-carb diet.',
      imageUrls: [
        ImageLinks.testrestaurant,
        ImageLinks.testrestaurant,
        ImageLinks.testrestaurant,
      ],
      isVerified: true,
      verificationStatus: 'Approved',
      orderOption: 'Pick-up',
    ),
    Meal(
      id: '2',
      name: 'Quinoa Salad with Grilled Chicken',
      type: 'Lunch',
      prepTime: 25,
      calories: 400,
      price: 250.0,
      specialtyTags: ['High-Protein', 'Keto', 'Vegan'],
      ingredients: ['Quinoa', 'Grilled Chicken', 'Cucumber', 'Walnut'],
      details:
          'A light and healthy quinoa salad with grilled chicken, packed with protein and essential nutrients.',
      imageUrls: [
        ImageLinks.testrestaurant,
        ImageLinks.testrestaurant,
        ImageLinks.testrestaurant,
      ],
      isVerified: true,
      verificationStatus: 'Approved',
      orderOption: 'Delivery',
    ),
    Meal(
      id: '3',
      name: 'Green Detox Smoothie',
      type: 'Snack',
      prepTime: 15,
      calories: 150,
      price: 50.0,
      specialtyTags: ['Vegan', 'Low-Carb'],
      ingredients: ['Broccoli', 'Cucumber', 'Orange'],
      details:
          'A refreshing detox smoothie packed with vitamins and nutrients for a healthy boost.',
      imageUrls: [
        ImageLinks.testrestaurant,
        ImageLinks.testrestaurant,
        ImageLinks.testrestaurant,
      ],
      isVerified: false,
      verificationStatus: 'Pending',
      orderOption: 'Pick-up',
    ),
  ];

  void _openAddMealBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: EditMealPopUpScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppPallete.ofWhiteColor4,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(width: 0.2, color: Colors.grey.shade400),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Meal Images',
              style: TextStyles.fontCircularSpotify14AccentBlackMedium),
          Text(
            'Upload a high-quality photo of your meal.\nBright lighting and simple backgrounds work best!',
            style: TextStyles.fontCircularSpotify12veryLightGray2Medium,
          ),
          SizedBox(height: 12.h),
          SizedBox(
            height: 94.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _images.length,
              separatorBuilder: (context, index) => SizedBox(width: 16.w),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _pickImage(index),
                  child: Container(
                    width: 121.w,
                    height: 94.h,
                    decoration: BoxDecoration(
                      color: AppPallete.ofWhiteColor4,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        width: 0.5.w,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    child: _images[index] == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                ImageLinks.frame,
                                height: 24.h,
                              ),
                              SizedBox(height: 8.h),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 4.h),
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
                                  style: TextStyles
                                      .circularSpotify14RegularDarkBlack,
                                ),
                              ),
                            ],
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.file(
                              _images[index]!,
                              width: 121.w,
                              height: 94.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Introduce Your Meal',
            style: TextStyles.fontCircularSpotify21AccentBlackColorMedium,
          ),
          Text(
            'Fill in your meal’s name, price, and special details.',
            style: TextStyles.fontCircularSpotify13DarkGreyColorrRegular,
          ),
          SizedBox(height: 12.h),
          GestureDetector(
            onTap: () => _openAddMealBottomSheet(context),
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
                style: TextStyles.fontCircularSpotify15lightWiteColorMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Center(
            child: Text(
              'Meals can be anything you prepare — from breakfast items to special dinners.',
              textAlign: TextAlign.center,
              style: TextStyles.fontCircularSpotify7GreyMedium,
            ),
          ),
        ]),
      ),
    );

    //     Container(
    //       child: Column(
    //         children: [

    //         SizedBox(height: 12.h),
    //         CustomContainerMeal(meals: fakeMeals),
    //         SizedBox(height: 4.h),
    //         Text(
    //           'Meals can be anything you prepare — from breakfast items to special dinners.',
    //           textAlign: TextAlign.center,
    //           style: TextStyles.fontCircularSpotify13DarkGreyColorrRegular,
    //         ),
    //       ],

    //   ),
    // );
  }
}
