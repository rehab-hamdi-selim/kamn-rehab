import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileTopBar extends StatelessWidget {
  const CustomProfileTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.arrow_back, size: 32.h),
            // Adjust size using ScreenUtil
            onPressed: () {
              // Action for back button
            },
          ),
          Text(
            'My Profile',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24.h,
                fontWeight: FontWeight.w700), // Adjust font size
          ),
          CircleAvatar(
            backgroundColor: const Color(0xffF6F6F6).withOpacity(.4),
            child: IconButton(
              padding: EdgeInsets.zero, // Remove padding
              iconSize: 32.h, // Set the icon size here
              icon: const Icon(Icons.notifications_outlined),
              color: Colors.white,
              onPressed: () {
                // Notification action
              },
            ),
          ),
        ],
      ),
    );
  }
}
