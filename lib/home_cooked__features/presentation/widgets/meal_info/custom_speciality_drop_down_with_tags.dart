// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kamn/core/theme/app_pallete.dart';
// import 'package:kamn/core/theme/style.dart';
// import 'package:kamn/home_cooked__features/presentation/widgets/meal_info/custom_speciality_tag.dart';

// class CustomSpecialityDropdownWithTags extends StatefulWidget {
//   const CustomSpecialityDropdownWithTags({super.key});

//   @override
//   _CustomSpecialityDropdownWithTagsState createState() =>
//       _CustomSpecialityDropdownWithTagsState();
// }

// class _CustomSpecialityDropdownWithTagsState
//     extends State<CustomSpecialityDropdownWithTags> {
//   String? selectedValue;
//   final List<String> mealOptions = [
//     "Keto", "Vegan", "Vegetarian", "Gluten Free", "Dairy Free"
//   ];
//   List<String> selectedTags = [];

//   void addTag(String tag) {
//     if (!selectedTags.contains(tag)) {
//       setState(() {
//         selectedTags.add(tag);
//       });
//     }
//   }

//   void removeTag(String tag) {
//     setState(() {
//       selectedTags.remove(tag);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Dropdown Field
//         Container(
//           width: 330.w,
//           height: 35.7.h,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10.r),
//           ),
//           child: DropdownButtonFormField<String>(
//             isExpanded: true,
//             value: null, // Keep value null to allow multiple selections
//             onChanged: (newValue) {
//               if (newValue != null) {
//                 addTag(newValue);
//               }
//             },
//             decoration: InputDecoration(
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.r),
//                 borderSide: const BorderSide(color: AppPallete.whiteGreyColor),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.r),
//                 borderSide: const BorderSide(color: AppPallete.whiteGreyColor),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.r),
//                 borderSide: const BorderSide(color: AppPallete.lgGreyColor, width: 2),
//               ),
//               contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
//             ),
//             hint: Text("Select Meal", style: TextStyles.fontCircularSpotify12GrayRegular),
//             items: mealOptions.map((String meal) {
//               return DropdownMenuItem<String>(
//                 value: meal,
//                 child: Text(meal, style: TextStyles.fontCircularSpotify14GrayRegular),
//               );
//             }).toList(),
//           ),
//         ),

//         SizedBox(height: 10.h),

//         // Display selected tags
//         Wrap(
//           spacing: 8.w,
//           runSpacing: 8.h,
//           children: selectedTags.map((tag) => CustomSpecialityTag(tag, removeTag)).toList(),
//         ),
// ],
// );
// }
// }
