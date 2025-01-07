import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_state.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/navigation_extension.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/utils/custom_app_bar.dart';
import 'package:kamn/features/authentication/presentation/cubits/sign_in_cubit/sign_in_view_model.dart';
import 'package:kamn/features/sports/presentation/widgets/my_profile/custom_profile_top_bar.dart';
import 'package:kamn/features/sports/presentation/widgets/my_profile/custome_add_service_button.dart';
import 'package:kamn/features/sports/presentation/widgets/my_profile/custome_user_data.dart';
import 'package:kamn/features/sports/presentation/widgets/my_profile/custome_user_options.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/theme/style.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppUserCubit, AppUserState>(
      listener: (context, state) {
        if (state.isClearUserData()) {
          context.pop();
          context.pushReplacementNamed(Routes.signInScreen);
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: CustomAppBar.appBar(
              color: AppPallete.blackColor,
              context: context,
              notificationIconFunction: () {},
              badgesIconFunction: () {},
              title: "My Profile"),
          backgroundColor: AppPallete.whiteColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const CustomUserData(),
                SizedBox(height: 16.h), // Responsive height
                const CustomeAddServiceButton(),
                SizedBox(height: 16.h), // Responsive height
                const CustomeUserOptions(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 35.w,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      context
                          .read<AppUserCubit>()
                          .signOutFromEmailandPassword();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppPallete.blackColor,
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 90.w),
                      // Adjust button size
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(51.r), // Adjust border radius
                      ),
                    ),
                    child: Text(
                      Constants.logout,
                      style: TextStyles
                          .font2OfWhiteMediumRoboto, // Adjust font size
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//init branch
