import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomGymFeatureItem extends StatelessWidget {
  const CustomGymFeatureItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99.h),
          color: AppPallete.lighttColor2),
      child: Text('🏋️‍♂️ Cardio',
          style: TextStyles.fontCircularSpotify7GreyMedium.copyWith(
            color: AppPallete.accentBlackColor,
          )),
    );
  }
}
