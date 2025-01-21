import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart' as badges;
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/show_snack_bar.dart';

class CustomGroundScreenAppBar {
  static AppBar appBar(
      {required Color color,
      String? title,
      required BuildContext context,
      required Function()? notificationIconFunction,
      required Function()? badgesIconFunction,
      Function()? profileFunction}) {
    return AppBar(
      leadingWidth: 45.w,
      elevation: 0,
      surfaceTintColor: color,
      backgroundColor: color,
      centerTitle: true,
      title: Text(title ?? "", style: TextStyles.font20White),
      leading: Row(
        children: [
          horizontalSpace(10.w),
          InkWell(
            onTap: () {
              showCustomDialog(context,
                  "Are you sure you want to close the app?", () => exit(0));
            },
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: title == null
                    ? AppPallete.greenColor
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
              backgroundColor:
                  title == null ? AppPallete.whiteColor : AppPallete.grayColor,
              radius: 16.0,
              child: Icon(
                Icons.notifications_none_outlined,
                color: title == null
                    ? AppPallete.blackColor
                    : AppPallete.whiteColor,
                size: 25.h,
              ),
            ),
          ),
        ),
        if (title == null) horizontalSpace(10),
        if (title == null)
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.myProfileScreen);
            },
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
