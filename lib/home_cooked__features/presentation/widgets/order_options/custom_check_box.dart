import 'package:flutter/material.dart';
import 'package:flutter_check_box_rounded/flutter_check_box_rounded.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key, this.onTap});
  final void Function(bool?)? onTap;
  @override
  Widget build(BuildContext context) {
    return CheckBoxRounded(
      borderColor: AppPallete.mediumLightGray,
      size: 25.sp,
      isChecked: false,
      checkedColor: AppPallete.greenColor,
      borderWidth: 2.w,
      //checkedWidget: Icon(Icons.abc, color: AppPallete.greenColor, size: 20),
      onTap: onTap,
      // (bool? value) {
      //   // setState(() {
      //   //   isChecked = value ?? false;
      //   // }

      //   // );
      // },
      animationDuration: Duration(milliseconds: 200),
    );
  }
}
