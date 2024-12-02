import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';

import '../../../../../core/theme_data/app_palette.dart';
import '../../../../../core/theme_data/style.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 5.5.w),
      decoration: BoxDecoration(
        color: AppPalette.lightGreenColor,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppPalette.greenColor,
          width: 1.w,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 12.sp,
            color: AppPalette.darkGreenColor,
          ),
          horizontalSpace(5.w),
          Text(
            text,
            style: Style.font10BlackColorW400,
          ),
          horizontalSpace(5.w),
          InkWell(
            onTap: onPressed,
            child: Icon(
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
