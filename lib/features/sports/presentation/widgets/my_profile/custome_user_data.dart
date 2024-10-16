import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUserData extends StatelessWidget {
  const CustomUserData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 24.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35.r, // Responsive radius
            backgroundColor: Colors.orangeAccent,
            backgroundImage: const AssetImage(
                'assets/images/profile_picture.png'), // Responsive icon size
          ),
          SizedBox(width: 16.w), // Responsive width
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mahmoud Sayed',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.h, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.h), // Responsive height
              Text(
                'josphamdes@gmail.com',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14.h, // Responsive font size
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                '+1 654 785 4462',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14.h,
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: ImageIcon(
              const AssetImage("assets/images/NotePencil.png"),
              size: 32.h,
              color: Colors.white,
            ),

            //Icon(Icons.edit_calendar_rounded, color: Colors.white, size: 24.sp), // Responsive icon size
            onPressed: () {
              // Edit profile action
            },
          )
        ],
      ),
    );
  }
}
