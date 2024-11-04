import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_pallete.dart';
import '../../../../../core/theme/style.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: AppPallete.lightGreenColorWithOpacity07,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppPallete.lightGreenColor,
          width: 1.w,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            size: 12.h,
            color: AppPallete.greenColor,
          ),
          Text(
            text,
            style: TextStyles.font10BlackColorW400,
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.cancel_outlined,
              color: AppPallete.grayColor,
              size: 12.h,
            ),
          ),
        ],
      ),
    );
  }
}
