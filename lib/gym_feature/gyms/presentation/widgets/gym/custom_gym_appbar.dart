import 'package:badges/badges.dart' as badges;
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

class CustomGymAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomGymAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      backgroundColor: AppPallete.lightWiteColor,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
                color: AppPallete.blackColor, shape: BoxShape.circle),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          )
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
                  radius: 21.r, // Responsive radius
                  backgroundColor: AppPallete.blackColor,
                  child: ClipOval(
                    child: context
                                .watch<AppUserCubit>()
                                .state
                                .user
                                ?.profileImage !=
                            null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: CachedNetworkImage(
                              imageUrl: context
                                  .watch<AppUserCubit>()
                                  .state
                                  .user!
                                  .profileImage!,
                              width: 40.r,
                              height: 40.r,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: SvgPicture.asset(
                              ImageLinks.defaultUserImage,
                              width: 60.r,
                              height: 60.r,
                            ),
                          ),
                  ),
                )),
          ),
          horizontalSpace(11.w),
          RichText(
            text: TextSpan(
                text: 'Welcome back 👋\n',
                style: TextStyles.fontCircularSpotify12GrayRegular,
                children: [
                  TextSpan(
                      text: 'Mohammed Ashraf',
                      style: TextStyles.fontCircularSpotify14AccentBlackMedium),
                ]),
          ),
        ],
      ),
      actions: [
       
        horizontalSpace(4.w),
        badges.Badge(
          ignorePointer: false,
          onTap: () {},
          position: badges.BadgePosition.topEnd(top: 6.h, end: 6.w),
          showBadge: true,
          child: InkWell(
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: AppPallete.lighttColor2,
              radius: 18.0.r,
              child: Icon(
                Icons.notifications_none_outlined,
                color: AppPallete.blackColor,
                size: 30.h,
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
