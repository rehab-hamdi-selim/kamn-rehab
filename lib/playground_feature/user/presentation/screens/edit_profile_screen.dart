import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/playground_feature/user/presentation/cubit/edit_profile/edit_profile_cubit.dart';
import 'package:kamn/playground_feature/user/presentation/cubit/edit_profile/edit_profile_state.dart';
import 'package:kamn/playground_feature/user/presentation/widgets/edit_profile/custom_edit_app_bar.dart';
import 'package:kamn/playground_feature/user/presentation/widgets/edit_profile/custom_profile_picture.dart';
import 'package:kamn/playground_feature/user/presentation/widgets/edit_profile/custom_user_info.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    super.key,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  double startSize = 60.r;
  double endSize = 100.r;
  double currentSize = 100.r;
  Alignment currentAlignment = Alignment.center;

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state.isImageUploaded) {
          context
              .read<EditProfileCubit>()
              .submit(context.read<AppUserCubit>().state.user!);
        }
        if (state.isSuccess) {
          showSnackBar(context, "Profile updated successfully");
          context.read<AppUserCubit>().getUser(uid: context.read<AppUserCubit>().state.user!.uid); 
        }
        if (state.isFailure) {
          showSnackBar(context, state.errorMessage!);
        }
      },
      child: Scaffold(
        appBar: CustomEditAppBar.appBar(context),
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward) {
              setState(() {
                // reduce current size
                currentSize = endSize;
                currentAlignment = Alignment.center;
              });
            } else if (notification.direction == ScrollDirection.reverse) {
              setState(() {
                // increase current size
                currentSize = startSize;
                currentAlignment = Alignment.topLeft;
              });
            }
            return true;
          },
          child: ListView(children: [
            CustomProfilePicture(
              currentAlignment: currentAlignment,
              currentSize: currentSize,
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomUserInfo()
          ]),
        ),
      ),
    );
  }
}
