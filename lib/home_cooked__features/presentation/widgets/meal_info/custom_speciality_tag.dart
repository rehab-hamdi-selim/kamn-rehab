import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomSpecialityTag extends StatelessWidget {
  final String tag;
  final Function(String) onRemove;

  const CustomSpecialityTag(this.tag, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppPallete.whiteColor,
        border: Border.all(color: AppPallete.whiteGreyColor),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(tag, style: TextStyles.fontCircularSpotify14LightBlackRegular),
          SizedBox(width: 5.w),
          GestureDetector(
            onTap: () => onRemove(tag),
            child: const Icon(Icons.close_rounded, color: AppPallete.blackColor, size: 16),
          ),
        ],
),
);
}
}