import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/features/sports/presentation/widget/profileHeader.dart';
import 'package:kamn/features/sports/presentation/widget/profileMenu.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back, size: 32.sp),
          // Adjust size using ScreenUtil
          onPressed: () {
            // Action for back button
          },
        ),
        actions: [
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.notifications, size: 32.sp),
            // Adjust size using ScreenUtil
            onPressed: () {
              // Notification action
            },
          ),
        ],
        backgroundColor: Color(0xffA117F1),
        title: Text(
          'My Profile',
          style: TextStyle(
              color: Colors.white, fontSize: 18.sp), // Adjust font size
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ProfileHeaderCustome(), // Profile Header Widget
          SizedBox(height: 16.h), // Responsive height
          Expanded(
            child: ProfileMenuCustome(), // Profile Menu Widget
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Logout action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  // Adjust button size
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20.r), // Adjust border radius
                  ),
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(
                      fontSize: 16.sp, color: Colors.white), // Adjust font size
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
