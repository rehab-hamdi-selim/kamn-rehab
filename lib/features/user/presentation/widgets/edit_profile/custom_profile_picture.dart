import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/user/presentation/cubit/edit_profile/edit_profile_cubit.dart';
import 'package:kamn/features/user/presentation/cubit/edit_profile/edit_profile_state.dart';

class CustomProfilePicture extends StatelessWidget {
  const CustomProfilePicture(
      {super.key, required this.currentAlignment, required this.currentSize});
  final Alignment currentAlignment;
  final double currentSize;

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AppUserCubit>().state.user;
    return AnimatedAlign(
      duration: const Duration(milliseconds: 300),
      alignment: currentAlignment,
      curve: Curves.fastOutSlowIn,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        child: Hero(
          tag: user?.uid ?? '',
          child: Stack(
            alignment: currentAlignment,
            children: [
              if (currentAlignment == Alignment.topLeft)
                Container(
                  height: 130.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF00C853), // Light green
                        Color(0xFF64DD17), // Medium green
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              Row(
                mainAxisAlignment: currentAlignment == Alignment.center
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: AppPallete.whiteColor,
                      shape: BoxShape.circle,
                    ),
                    margin: currentAlignment != Alignment.center
                        ? EdgeInsets.only(
                            top: 30.0.h, left: 20.0.w, right: 20.0.w)
                        : EdgeInsets.zero,
                    padding: currentAlignment != Alignment.center
                        ? const EdgeInsets.all(5.0)
                        : EdgeInsets.zero,
                    child: Stack(
                      children: [
                        BlocBuilder<EditProfileCubit, EditProfileState>(
                          builder: (context, state) {
                            return CircleAvatar(
                              radius: currentSize, // Responsive radius
                              backgroundColor: AppPallete.orangeAccentColor,
                              backgroundImage: user?.profileImage != null ||
                                      state.picturePicked != null
                                  ? state.picturePicked != null
                                      ? FileImage(state.picturePicked!)
                                      : NetworkImage(user!.profileImage!)
                                  : null,
                              child: state.profilePictureUrl == null &&
                                      user?.profileImage == null &&
                                      state.picturePicked == null
                                  ? SvgPicture.asset(
                                      ImageLinks.defaultUserImage,
                                      width: currentSize,
                                      height: currentSize,
                                    )
                                  : null,
                            );
                          },
                        ),
                        if (currentAlignment == Alignment.center)
                          Positioned(
                            top: 0,
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                context
                                    .read<EditProfileCubit>()
                                    .changeProfilePicture();
                              },
                              child: Container(
                                width: 50.w,
                                height: 50.h,
                                padding: EdgeInsets.all(5.w),
                                decoration: const BoxDecoration(
                                    color: AppPallete.whiteColor,
                                    shape: BoxShape.circle),
                                child: CircleAvatar(
                                  backgroundColor: AppPallete.ligtGreyColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: SizedBox.expand(
                                      child: SvgPicture.asset(
                                        'assets/icons/add_image.svg',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (currentAlignment == Alignment.topLeft)
                    Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user?.name ?? '',
                            style: TextStyles.font20White,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text(
                            user?.type ?? '',
                            style: TextStyles.font18White,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
