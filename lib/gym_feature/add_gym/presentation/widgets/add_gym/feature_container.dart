// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kamn/core/theme/app_pallete.dart';
// import 'package:kamn/core/theme/style.dart';
// import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/features_offer.dart';

// class FeaturesContainer extends StatelessWidget {
//   const FeaturesContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: 335.w,
//           padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.w),
//           decoration: ShapeDecoration(
//             color: const Color(0xFFF6F6F6),
//             shape: RoundedRectangleBorder(
//               side: const BorderSide(
//                 width: 0.20,
//                 color: Color(0xFFBBBBBB),
//               ),
//               borderRadius: BorderRadius.circular(20),
//             ),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Text("Features Added During Gym Submission",
//                   style: TextStyles.fontCircularSpotify14AccentBlackMedium),
//               Text(
//                   "Choose from the features you previously added during gym submission or add new ones tailored to this plan.",
//                   style: TextStyles.fontCircularSpotify10darkGreyColorRegular),
//               SizedBox(height: 8.h),

//               const FeatureTaggingScreen(),
//               //  SizedBox(height: 19.h),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
