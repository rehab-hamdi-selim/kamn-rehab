import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBadge extends StatelessWidget {
  final String label;
  final Color color;

  const CustomBadge({required this.label, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
      // Use ScreenUtil for padding
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.w), // Use ScreenUtil for radius
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 10.sp, // Use ScreenUtil for font size
        ),
      ),
    );
  }
}
