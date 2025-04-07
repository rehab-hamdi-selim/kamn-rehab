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
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/theme/style.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});
////////////////////////
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
            child: Column(
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
                    text:
                        'Once verified, your meals will be visible to customers.\n',
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
            ),
          )
        ],
      ),
    );
  }
}
