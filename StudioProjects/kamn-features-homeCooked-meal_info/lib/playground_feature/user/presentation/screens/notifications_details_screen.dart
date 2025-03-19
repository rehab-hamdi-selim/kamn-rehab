import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import '../../data/models/notifications_model.dart';

class NotificationDetailsScreen extends StatelessWidget {
  final NotificationsModel notification;

  const NotificationDetailsScreen({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification Details',
          style: TextStyle(
            color: AppPallete.blackColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppPallete.whiteColor,
        iconTheme: const IconThemeData(color: AppPallete.blackColor),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification.title,
              style: TextStyle(
                color: AppPallete.blackColor,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: AppPallete.darkVividVioletColor,
                  child: Text(
                    'KS',
                    style: TextStyle(
                      color: AppPallete.whiteColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kamn Sports',
                      style: TextStyle(
                        color: AppPallete.blackColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'kamnSports@gmail.com',
                      style: TextStyle(
                        color: AppPallete.grayColor,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              DateFormat('MMM d, yyyy - h:mm a').format(notification.timestamp),
              style: TextStyle(
                color: AppPallete.grayColor,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 16.h),
            Divider(color: AppPallete.grayColor.withOpacity(0.5)),
            SizedBox(height: 16.h),
            Text(
              notification.body,
              style: TextStyle(
                color: AppPallete.blackColor,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
