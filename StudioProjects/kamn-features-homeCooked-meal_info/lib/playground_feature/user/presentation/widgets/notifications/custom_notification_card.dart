import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import '../../../data/models/notifications_model.dart';

class CustomNotificationCard extends StatelessWidget {
  final NotificationsModel notification;
  final VoidCallback onTap;

  const CustomNotificationCard({
    super.key,
    required this.notification,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: notification.isRead
              ? AppPallete.whiteColor
              : AppPallete.lightWhiteColor.withOpacity(0.1),
          border: Border(
            bottom: BorderSide(
              color: AppPallete.grayColor.withOpacity(0.2),
              width: 1,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kamn Sports',
                        style: TextStyle(
                          color: AppPallete.blackColor,
                          fontSize: 14.sp,
                          fontWeight: notification.isRead
                              ? FontWeight.normal
                              : FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat('MMM d').format(notification.timestamp),
                        style: TextStyle(
                          color: AppPallete.grayColor,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    notification.title,
                    style: TextStyle(
                      color: AppPallete.blackColor,
                      fontSize: 14.sp,
                      fontWeight: notification.isRead
                          ? FontWeight.normal
                          : FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    notification.body,
                    style: TextStyle(
                      color: AppPallete.grayColor,
                      fontSize: 12.sp,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
