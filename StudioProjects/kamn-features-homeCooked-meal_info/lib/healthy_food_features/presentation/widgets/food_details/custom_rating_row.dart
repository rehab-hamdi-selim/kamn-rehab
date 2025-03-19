import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/food_details/custom_text.dart';

class CustomRatingRow extends StatelessWidget {
  const CustomRatingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.amber, size: 20.w),
        SizedBox(width: 4.w),
        CustomText("4.8", 16.sp, FontWeight.normal),
        SizedBox(width: 8.w),
        CustomText("120", 16.sp, FontWeight.normal),
        SizedBox(width: 8.w),
        Icon(Icons.local_fire_department, color: Colors.red, size: 20.w),
        SizedBox(width: 4.w),
        CustomText("150 kcal", 16.sp, FontWeight.normal),
      ],
    );
  }
}
