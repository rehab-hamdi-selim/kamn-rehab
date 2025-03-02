import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:badges/badges.dart' as badges;

class CustomGymAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomGymAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppPallete.lightWiteColor,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.all(15.0.h),
          child: Container(
            padding: EdgeInsets.all(3.h),
            decoration: const BoxDecoration(
              color: AppPallete.accentBlackColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back_rounded,
              size: 20.h,
              color: AppPallete.lightGrayColor,
            ),
          ),
        ),
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.myProfileScreen);
            },
            child: Hero(
                tag: context.watch<AppUserCubit>().state.user?.uid ?? '',
                child: CircleAvatar(
                  radius: 20.r, // Responsive radius
                  backgroundColor: AppPallete.blackColor,
                  backgroundImage:
                      context.watch<AppUserCubit>().state.user?.profileImage !=
                              null
                          ? CachedNetworkImageProvider(context
                              .watch<AppUserCubit>()
                              .state
                              .user!
                              .profileImage!)
                          : null,
                  child:
                      context.watch<AppUserCubit>().state.user?.profileImage ==
                              null
                          ? SvgPicture.asset(
                              ImageLinks.defaultUserImage,
                              width: 60.r,
                              height: 60.r,
                            )
                          : null,
                )),
          ),
          horizontalSpace(11.w),
          RichText(
            text: TextSpan(
                text: 'Welcome back 👋\n',
                style: TextStyles.font12CircularSpotifyTextDarkGeryMedium,
                children: [
                  TextSpan(
                      text: 'Mohammed Ashraf',
                      style: TextStyles.fontCircularSpotify14MediumAccentBlack),
                ]),
          ),
        ],
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: CircleAvatar(
            backgroundColor: AppPallete.lighttColor2,
            radius: 18.0.r,
            child: Icon(
              Icons.search_rounded,
              color: AppPallete.blackColor,
              size: 32.h,
            ),
          ),
        ),
        horizontalSpace(4.w),
        badges.Badge(
          ignorePointer: false,
          onTap: () {},
          position: badges.BadgePosition.topEnd(top: 5.h, end: 5.w),
          showBadge: true,
          child: InkWell(
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: AppPallete.lighttColor2,
              radius: 18.0.r,
              child: Icon(
                Icons.notifications_none_outlined,
                color: AppPallete.blackColor,
                size: 32.h,
              ),
            ),
          ),
        ),
        horizontalSpace(15.w),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
