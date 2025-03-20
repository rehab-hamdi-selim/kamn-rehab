// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../../core/theme/font_weight_helper.dart';
//
// class CustomGeneralButton extends StatelessWidget{
//   final String? textButton;
//   VoidCallback ontab =() {} ;
//   final double buttonWidth;
//   final Color buttonColor;
//   final Color buttonTextColor;
//
//    CustomGeneralButton({super.key, required this.textButton ,  required this.ontab, required this.buttonWidth, required this.buttonColor, required this.buttonTextColor, });
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: ontab,
//       child: Container(
//         decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r),
//         color: buttonColor,
//         ),
//         width: buttonWidth,
//         height: 30.h,
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(0, 3.4, 0, 0),
//           child: Text(textButton!,style: TextStyle(
//                 fontFamily: "Roboto",
//                 color: buttonTextColor,
//                 fontWeight: FontWeightHelper.regular,
//                 fontSize: 14.h),textAlign: TextAlign.center ,),
//         ),
//       ),
//     );
//   }
// }
