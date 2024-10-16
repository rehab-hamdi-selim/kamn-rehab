import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';

class ProfileHeaderCustome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, left: 16, right: 3, bottom: 16),
      color: Color(0xffA117F1),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35.r, // Responsive radius
            backgroundColor: Colors.orangeAccent,
            backgroundImage: AssetImage(
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
                  fontSize: 20.sp, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.h), // Responsive height
              Text(
                'josphamdes@gmail.com',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14.sp, // Responsive font size
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                '+1 654 785 4462',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            icon: ImageIcon(
              AssetImage("assets/images/NotePencil.png"),
              size: 32,
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
