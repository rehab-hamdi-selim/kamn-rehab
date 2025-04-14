import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/utils/custom_gym_button.dart';

class CustomSuccessAddPlanWidget extends StatelessWidget {
  final VoidCallback onGoToProfilePressed;

  const CustomSuccessAddPlanWidget({
    super.key,
    required this.onGoToProfilePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 40.w,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'Plan Successfully Submitted!',
            style: TextStyle(
              color: Colors.green,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Your membership plan has been submitted for review. Once approved, it will be published and visible to users',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 24.h),
          CustomGymButton(
            onPressed: onGoToProfilePressed,
            text: 'Go to profile',
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
