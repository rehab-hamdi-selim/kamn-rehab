import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_state.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomUserData extends StatelessWidget {
  const CustomUserData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 18.h),
      decoration: BoxDecoration(
          color: AppPallete.blackColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24.r),
              bottomRight: Radius.circular(24.r))),
      child: Row(
        children: [
          CircleAvatar(
            radius: 31.r, // Responsive radius
            backgroundColor: AppPallete.orangeAccentColor,
            backgroundImage: const AssetImage(
                ImageLinks.profile_picture), // Responsive icon size
          ),
          SizedBox(width: 16.w), // Responsive width
          BlocBuilder<AppUserCubit, AppUserState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(state.user?.name ?? '', style: TextStyles.font18White),

                  verticalSpace(7.h), // Responsive height
                  Text(state.user?.email ?? '',
                      style: TextStyles.font14White70),
                  verticalSpace(7.h),
                  Text(Constants.phoneNumber, style: TextStyles.font14White70),
                ],
              );
            },
          ),
          const Spacer(),
          IconButton(
            icon: ImageIcon(
              const AssetImage(ImageLinks.NotePencilIcon),
              size: 32.h,
              color: AppPallete.whiteColor,
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
