// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/meal_review_cubit/meal_cubit.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/meal_review_cubit/meal_state.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/Food_details_info/custom_speciality_tags.dart';

// class CustomSpecialityDropdownWithTags extends StatefulWidget {
//   @override
//   _CustomSpecialityDropdownWithTagsState createState() =>
//       _CustomSpecialityDropdownWithTagsState();
// }

class CustomSpecialityDropdownWithTags extends StatelessWidget {
  final List<String> mealOptions = [
    "Keto",
    "Vegan",
    "Vegetarian",
    "Gluten Free",
    "Dairy Free"
  ];
  CustomSpecialityDropdownWithTags({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Dropdown Field
        Container(
          width: 330.w,
          height: 35.7.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: DropdownButtonFormField<String>(
            isExpanded: true,
            value: null, // Keep value null to allow multiple selections
            onChanged: (newValue) {
              if (newValue != null) {
                context.read<MealCubit>().addSpecialtyTag(newValue);
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: AppPallete.whiteGreyColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: AppPallete.whiteGreyColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: AppPallete.lgGreyColor, width: 2),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            ),
            hint: Text("Select Meal",
                style: TextStyles.fontCircularSpotify12GrayRegular),
            items: mealOptions.map((String meal) {
              return DropdownMenuItem<String>(
                value: meal,
                child: Text(meal,
                    style: TextStyles.fontCircularSpotify14GrayRegular),
              );
            }).toList(),
          ),
        ),

        SizedBox(height: 10.h),

        // Display selected tags
        BlocBuilder<MealCubit, MealState>(
          buildWhen: (previous, current) =>
              previous.specialtyTags != current.specialtyTags,
          builder: (context, state) {
            return Wrap(
              spacing: 8,
              runSpacing: 8,
              children: state.specialtyTags.map((tag) {
                return CustomSpecialityTag(
                  tag,
                  (tag) => context.read<MealCubit>().removeSpecialtyTag(tag),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
