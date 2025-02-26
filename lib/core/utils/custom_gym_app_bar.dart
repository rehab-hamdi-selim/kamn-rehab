import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';

class CustomGymAppBar {
  static AppBar appBar(
      {required Color color,
      bool? firstScreen,
      String? title,
      required BuildContext context,
      required Function()? notificationIconFunction,
      required Function()? badgesIconFunction,
      Function()? profileFunction}) {
    final user = context.watch<AppUserCubit>().state.user;
    return AppBar(
      leadingWidth: 45.w,
      elevation: 0,
      surfaceTintColor: color,
      backgroundColor: color,
      centerTitle: true,
      title: Text(title ?? "", style: TextStyles.fontInter20WhiteSemiBold),
      leading: Row(
        children: [
          horizontalSpace(10.w),
          InkWell(
            onTap: () {
              if (firstScreen != null && firstScreen == true) {
                showCustomDialog(context,
                    "Are you sure you want to close the app?", () => exit(0));
              } else {
                Navigator.maybePop(context);
              }
            },
            child: Container(
              padding: EdgeInsets.all(3.h),
              decoration: BoxDecoration(
                color: title == null
                    ? AppPallete.blackColor
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
              radius: 16.0.r,
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
              // Navigator.pushNamed(context, Routes.myProfileScreen);
            },
            child: Hero(
                tag: user?.uid ?? '',
                child: CircleAvatar(
                  radius: 16.r, // Responsive radius
                  backgroundColor: AppPallete.blackColor,
                  backgroundImage: user?.profileImage != null
                      ? CachedNetworkImageProvider(user!.profileImage!)
                      : null,
                  child: user?.profileImage == null
                      ? SvgPicture.asset(
                          ImageLinks.defaultUserImage,
                          width: 60.r,
                          height: 60.r,
                        )
                      : null,
                )),
          ),
        horizontalSpace(18.w),
      ],
    );
  }
}
