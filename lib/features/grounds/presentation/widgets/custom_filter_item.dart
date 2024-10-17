import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme_data/app_palette.dart';
import '../../../../core/theme_data/style.dart';

class CustomFilterItem extends StatelessWidget {
  final IconData? icon;
  final String text;
  final void Function()? onPressed;
  const CustomFilterItem({
  super.key,
  required this.icon,
  required this.text,
  required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding:EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color:AppPalette.lightGreenColor,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppPalette.greenColor,
          width: 1.w,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            size: 12.sp,
            color: AppPalette.darkGreenColor,
          ),
          Text(
            text,
            style: Style.font10BlackColorW400,
          ),
          IconButton(
            onPressed:onPressed,
            icon: Icon(
              Icons.cancel_outlined,
              color: AppPalette.grayColor,
              size: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
