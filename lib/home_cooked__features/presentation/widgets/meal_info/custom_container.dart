// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kamn/core/const/image_links.dart';
// import 'package:kamn/core/theme/app_pallete.dart';
// import 'package:kamn/core/theme/style.dart';

// class CustomContainer extends StatelessWidget {
//   const CustomContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           padding: EdgeInsets.symmetric(
//             horizontal: 20.w,
//             vertical: 10.h,
//           ),
//           decoration: ShapeDecoration(
//             image: const DecorationImage(
//               image: AssetImage(
//                 ImageLinks.backgroundImage,
//               ),
//               fit: BoxFit.fill,
//             ),
//             shape: RoundedRectangleBorder(
//               side: BorderSide(
//                 width: 0.40.w,
//                 color: const Color.fromARGB(255, 26, 23, 23),
//               ),
//               borderRadius: BorderRadius.circular(13.r),
//             ),
//             shadows: [
//               BoxShadow(
//                 color: AppPallete.transparentBlack,
//                 blurRadius: 16,
//                 offset: Offset(0, 0),
//                 spreadRadius: 0,
//               )
//             ],
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             spacing: 2,
//             children: [
//               SizedBox(
//                 width: 295.w,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   spacing: 8.h,
//                   children: [
//                     SizedBox(
//                       width: double.infinity,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         spacing: 2.h,
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             spacing: 2.h,
//                             children: [
//                               Text(
//                                 'Pending Verification',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyles
//                                     .fontCircularSpotify16lightWhiteColorMedium,
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 295.w,
//                             child: Text(
//                               'Your personal information and utility bill are under review.',
//                               style: TextStyles
//                                   .fontCircularSpotify10lightWhiteColorMedium,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 295.w,
//                             child: Text.rich(
//                               TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text: '\n',
//                                     style: TextStyles
//                                         .fontCircularSpotify12lightWhiteColorMedium,
//                                   ),
//                                   TextSpan(
//                                     text:
//                                         'Once verified, your meals will be visible to customers.\nApproval usually takes 1-2 business days.\nDouble-check your uploaded utility bill is clear and matches your home address.',
//                                     style: TextStyles
//                                         .fontCircularSpotify12lightWhiteColorMedium,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/home_cooked__features/data/models/meals_model.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/meal_review_cubit/meal_cubit.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/meal_review_cubit/meal_state.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.mealCubit});
////////////////////////
  final MealCubit mealCubit;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.h,
      height: 163.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.r),
        image: DecorationImage(
          image: AssetImage(ImageLinks.backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // الطبقة الشفافة (Overlay)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.r),
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          // النص
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: BlocBuilder<MealCubit, MealState>(
                builder: (context, state) {
                  final meal = state.selectedMeal;

                  if (meal == null) {
                    return const SizedBox.shrink(); // or a loading/placeholder
                  }
                  switch (meal.status) {
                    case MealModelStatus.ACCEPTED:
                      return const CustomAcceptedWidget();
                    case MealModelStatus.REJECTED:
                      return const CustomRejectedWidget();
                    case MealModelStatus.PENDING:
                      return const CustomPendingWidget();

                    default:
                      return const SizedBox.shrink();
                  }
                },
              ))
        ],
      ),
    );
  }
}

class CustomPendingWidget extends StatelessWidget {
  const CustomPendingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pending Verification',
          textAlign: TextAlign.center,
          style: TextStyles.fontCircularSpotify10White,
        ),
        Text(
          'Your personal information and utility bill are under review. ',
          style: TextStyles.fontCircularSpotify10White,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
            text: '.',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.h,
                color: Colors.white),
          ),
          TextSpan(
            text: 'Once verified, your meals will be visible to customers.\n',
            style: TextStyles.fontCircularSpotify10White,
          ),
          TextSpan(
              text: '.',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.h,
                  color: Colors.white)),
          TextSpan(
            text: 'Approval usually takes 1-2 business days.\n',
            style: TextStyles.fontCircularSpotify10White,
          ),
          TextSpan(
              text: '.',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.h,
                  color: Colors.white)),
          TextSpan(
            text:
                ' Double-check your uploaded utility bill is clear and matches your home address.',
            style: TextStyles.fontCircularSpotify10White,
          ),
        ]))
      ],
    );
  }
}

class CustomRejectedWidget extends StatelessWidget {
  const CustomRejectedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Verification Rejected',
          textAlign: TextAlign.center,
          style: TextStyles.fontCircularSpotify10White,
        ),
        Text(
          'Unfortunately, your personal information and utility bill could not be verified.',
          style: TextStyles.fontCircularSpotify10White,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
            text: '.',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.h,
                color: Colors.white),
          ),
          TextSpan(
            text:
                'Please ensure that your utility bill is clear and matches your home address.\n',
            style: TextStyles.fontCircularSpotify10White,
          ),
          TextSpan(
              text: '.',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.h,
                  color: Colors.white)),
          TextSpan(
            text:
                'If you believe this is an error, please reach out to support.\n',
            style: TextStyles.fontCircularSpotify10White,
          ),
          TextSpan(
              text: '.',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.h,
                  color: Colors.white)),
          TextSpan(
            text:
                'Once the issue is resolved, you can reapply for verification.',
            style: TextStyles.fontCircularSpotify10White,
          ),
        ]))
      ],
    );
  }
}

class CustomAcceptedWidget extends StatelessWidget {
  const CustomAcceptedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Verification Accepted',
          textAlign: TextAlign.center,
          style: TextStyles.fontCircularSpotify10White,
        ),
        Text(
          'Congratulations! Your personal information and utility bill have been successfully verified.',
          style: TextStyles.fontCircularSpotify10White,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
            text: '.',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.h,
                color: Colors.white),
          ),
          TextSpan(
            text:
                'Your meals are now visible to customers, and you can start receiving orders.\n',
            style: TextStyles.fontCircularSpotify10White,
          ),
          TextSpan(
              text: '.',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.h,
                  color: Colors.white)),
          TextSpan(
            text: 'We wish you success in your home-cooked meal business!\n',
            style: TextStyles.fontCircularSpotify10White,
          ),
          TextSpan(
              text: '.',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.h,
                  color: Colors.white)),
          TextSpan(
            text:
                'If you need any further assistance, feel free to contact support.',
            style: TextStyles.fontCircularSpotify10White,
          ),
        ]))
      ],
    );
  }
}
