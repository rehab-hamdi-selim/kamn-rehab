import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart' as badges;
import 'package:kamn/core/theme/style.dart';
import '../helpers/spacer.dart';
import '../theme/app_pallete.dart';
import 'app_images.dart';

class CustomAppBarServiceProvider {
  static AppBar appBar(
      {required Color color,
      String? title,
      required Function()? arrowFunction,
      required Function()? notificationIconFunction,
      required Function()? badgesIconFunction,
      required Function()? profileFunction}) {
    return AppBar(
      leadingWidth: 45.w,
      elevation: 0,
      surfaceTintColor: color,
      backgroundColor: color,
      centerTitle: true,
      title: Text(title ?? "", style: TextStyles.font20White),
      leading: Row(
        children: [
          horizontalSpace(18.w),
          InkWell(
            onTap: arrowFunction,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: title == null
                    ? AppPallete.accentBlackColor
                    : AppPallete.grayColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_back_rounded,
                size: 20.h,
                color: AppPallete.lightGrayColor,
              ),
            ),
          ),
        ],
      ),
      actions: [
        badges.Badge(
          ignorePointer: false,
          onTap: notificationIconFunction,
          position: badges.BadgePosition.topEnd(top: 5.h, end: 5.w),
          showBadge: true,
          child: InkWell(
            onTap: badgesIconFunction,
            child: CircleAvatar(
              child: Icon(
                Icons.notifications_none_outlined,
                color: title == null
                    ? AppPallete.blackColor
                    : AppPallete.whiteColor,
                size: 25.h,
              ),
              backgroundColor:
                  title == null ? AppPallete.whiteColor : AppPallete.grayColor,
              radius: 16.0,
            ),
          ),
        ),
        if (title == null) horizontalSpace(10),
        if (title == null)
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
