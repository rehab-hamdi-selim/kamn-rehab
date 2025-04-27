// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kamn/core/theme/app_pallete.dart';
// import 'package:kamn/core/theme/style.dart';
// import 'package:kamn/core/utils/custome_text_form_field.dart';
//
// class CustomTxtField extends StatelessWidget {
//   final MyValidator? valodator;
//   final double height;
//   final double width;
//   final String hintText;
//
//   final TextEditingController txtController;
//   final bool hasCounter;
//   final int? maxLines;
//   final String? suffixtext;
//   final String? text;
//   const CustomTxtField(
//       {super.key,
//       this.valodator,
//       required this.height,
//       required this.width,
//       required this.hintText,
//       required this.txtController,
//       required this.hasCounter,
//       this.maxLines,
//       this.suffixtext,
//       this.text
//       });
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width.w,
//       height: 35.h,
//       child: TextFormField(
//
//         style: TextStyles.fontCircularSpotify12BlackRegular,
//         controller: txtController,
//         validator: valodator,
//         maxLines: maxLines,
//         decoration: InputDecoration(
//           isDense: true,
//           labelText: text,
//           //label: text != null ? Text(text!, style: TextStyles.fontCircularSpotify12GrayRegular,) : null,
//           counterText: hasCounter ? '200' : null,
//           counterStyle: TextStyles.fontCircularSpotify10GreenRegular,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.r),
//             borderSide: BorderSide(color: AppPallete.whiteGreyColor),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.r),
//             borderSide: BorderSide(color: AppPallete.whiteGreyColor),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.r),
//             borderSide: BorderSide(color: AppPallete.lgGreyColor, width: 2),
//           ),
//           suffixText: suffixtext,
//           hintText: hintText,
//           hintStyle: TextStyles.fontCircularSpotify12GrayRegular,
//           contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custome_text_form_field.dart';

class CustomTxtField extends StatelessWidget {
  final MyValidator? valodator;
  final double? height;
  final double width;
  final String hintText;
  final TextEditingController txtController;
  final bool hasCounter;
  final int? maxLines;
  final String? suffixtext;
  final String? text;

  const CustomTxtField({
    super.key,
    this.valodator,
    this.height,
    required this.width,
    required this.hintText,
    required this.txtController,
    required this.hasCounter,
    this.maxLines,
    this.suffixtext,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      child: TextFormField(
        style: TextStyles.fontCircularSpotify12BlackRegular,
        controller: txtController,
        validator: valodator,
        maxLines: maxLines ?? 1,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          isDense: true,
          labelText: text,
          counterText: hasCounter ? '200' : null,
          counterStyle: TextStyles.fontCircularSpotify10GreenRegular,
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
          suffixText: suffixtext,
          hintText: hintText,
          hintStyle: TextStyles.fontCircularSpotify12GrayRegular,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        ),
      ),
    );
  }
}
