import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart' as badges;
import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/theme/app_pallete.dart';
import '../../../../../core/utils/app_images.dart';

class CustomTextAppBar {
  static AppBar appBar({
    required Function()? notificationIconFunction,
    required Function()? badgesIconFunction,
    required Function()? profileFunction,
    Widget? titleWidget,
  }) {
    return AppBar(
      leadingWidth: 45.w,
      elevation: 0,
      surfaceTintColor: AppPallete.whiteColor,
      backgroundColor: AppPallete.whiteColor,
      title: titleWidget,
      actions: [
        badges.Badge(
          ignorePointer: false,
          onTap: notificationIconFunction,
          position: badges.BadgePosition.topEnd(top: 10.h, end: 10.w),
          showBadge: true,
          child: IconButton(
            onPressed: badgesIconFunction,
            icon: Icon(
              Icons.notifications_none_outlined,
              size: 32.h,
            ),
          ),
        ),
        horizontalSpace(10),
        InkWell(
          onTap: profileFunction,
          child: const CircleAvatar(
            backgroundImage: AssetImage(AppImages.profileImage),
            radius: 16.0,
          ),
        ),
        horizontalSpace(18),
      ],
    );
  }
}
