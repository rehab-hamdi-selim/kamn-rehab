import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';


class CustomAvaliableButton extends StatelessWidget {
  const CustomAvaliableButton({super.key, required this.available});
  final String available;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: AppPallete.whiteColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppPallete.greenColor,
              width: 1.w,
            ),
          ),
          child: Container(
            height: 4.h,
            width: 4.w,
            decoration: const BoxDecoration(
                color: AppPallete.greenColor, shape: BoxShape.circle),
          ),
        ),
        horizontalSpace(4),
        Text(
          available,
          style: TextStyles.fontCircularSpotify7BlackRegular,
        ),
      ],
    );
  }
}
