import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart' as badges;
import '../../../../../core/commen/widgets/sized_box_style.dart';
import '../../../../../core/theme_data/app_palette.dart';
import '../../../../../core/utils/app_images.dart';

class CustomAppBar {
  static AppBar appBar(
      {required Function()? arrowFunction,
      required Function()? notificationIconFunction,
      required Function()? badgesIconFunction,
      required Function()? profileFunction}) {
    return AppBar(
      leadingWidth: 45.w,
      leading: Row(
        children: [
          SizedBoxStyle.horizontal(18.w),
          InkWell(
            onTap: arrowFunction,
            child: Container(
              decoration: const BoxDecoration(
                color: AppPalette.darkGreenColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_back_rounded,
                size: 24.h,
                color: AppPalette.lightGrayColor,
              ),
            ),
          ),
        ],
      ),
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
        SizedBoxStyle.horizontal(10.w),
        InkWell(
          onTap: profileFunction,
          child: const CircleAvatar(
            backgroundImage: AssetImage(AppImages.profileImage),
            radius: 16.0,
          ),
        ),
        SizedBoxStyle.horizontal(18.w),
      ],
    );
  }
}
