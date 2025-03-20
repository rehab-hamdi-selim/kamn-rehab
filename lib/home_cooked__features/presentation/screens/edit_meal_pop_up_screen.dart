import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_homecook_ingredients.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_meal_type_selection.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_required_txt.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_speciality_drop_down_with_tags.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_txt_field.dart';

class EditMealPopUpScreen extends StatefulWidget {
  @override
  _EditMealPopUpScreenState createState() => _EditMealPopUpScreenState();
}

TextEditingController mealNameController = TextEditingController();
TextEditingController prepController = TextEditingController();
TextEditingController kcalController = TextEditingController();
TextEditingController priceController = TextEditingController();
TextEditingController descriptionController = TextEditingController();

class _EditMealPopUpScreenState extends State<EditMealPopUpScreen> {
  String selectedMealType = "Breakfast";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.9,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40.r)),
      ),
      child: Column(
        children: [
          Center(
            child: Container(
              width: 50.w,
              height: 6.h,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          verticalSpace(8.h),
          Expanded(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Meal Type",
                      style: TextStyles.circularSpotify14RegularDarkBlack),
                  verticalSpace(7.h),
                  CustomMealTypeSelection(
                    selectedMealType: selectedMealType,
                    onMealTypeSelected: (mealType) {
                      setState(() {
                        selectedMealType =
                            mealType; // Update selected meal type
                      });
                    },
                  ),
                  verticalSpace(12.h),
                  customRequiredTxt("Meal Name"),
                  verticalSpace(7.h),
                  customTxtField(35.73.h, 315.w, "Enter Meal Name",
                      mealNameController, false, 1, ""),
                  verticalSpace(12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customRequiredTxt("Prep time"),
                      customRequiredTxt("🔥 ${Constants.kCal}"),
                    ],
                  ),
                  verticalSpace(7.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customTxtField(35.73.h, 120.w, "00:00", prepController,
                          false, 1, Constants.minute),
                      customTxtField(
                          35.73.h, 120.w, "0", kcalController, false, 1, "🔥"),
                    ],
                  ),
                  verticalSpace(12.h),
                  customRequiredTxt("Price"),
                  customTxtField(35.73.h, 315.w, "Enter price", priceController,
                      false, 1, Constants.egp),
                  verticalSpace(12.h),
                  customRequiredTxt("Specialty Tags"),
                  verticalSpace(7.h),
                  Center(child: CustomSpecialityDropdownWithTags()),
                  verticalSpace(10.h),
                  Center(
                    child: Text(
                      "Choose tags like Vega, or Keto to help users find your meals.",
                      style: TextStyles.fontCircularSpotify10StealGrayMedium,
                    ),
                  ),
                  verticalSpace(7.h),
                  //CustomSpecialityTags(),
                  verticalSpace(12.h),
                  Text("Ingredients",
                      style: TextStyles.circularSpotify14RegularGreycolor),
                  Text(
                    "List all ingredients used, This helps users with allergies or dietary preferences.",
                    style: TextStyles.fontCircularSpotify8StealGrayRegular,
                  ),
                  verticalSpace(12.h),
                  CustomHomecookIngredients(),
                  verticalSpace(12.h),
                  Text("Details",
                      style: TextStyles.circularSpotify14RegularDarkBlack),
                  verticalSpace(7.h),
                  customTxtField(111.h, 315.w, "Enter description",
                      descriptionController, true, 7, ""),
                  verticalSpace(20.h),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              fixedSize: Size(315.w, 50.h),
              foregroundColor: AppPallete.whiteColor,
              backgroundColor: AppPallete.blackColor,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageLinks.check, width: 14.w, height: 14.h),
                horizontalSpace(10.w),
                Text(Constants.save,
                    style: TextStyles.fontCircularSpotify14WhiteMedium),
              ],
            ),
          ),
          verticalSpace(10.h),
        ],
      ),
    );
  }
}
