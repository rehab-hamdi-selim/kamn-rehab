import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/playground_feature/user/presentation/cubit/edit_profile/edit_profile_cubit.dart';
import 'package:kamn/playground_feature/user/presentation/cubit/edit_profile/edit_profile_state.dart';

class CustomEditAppBar {
  static AppBar appBar(BuildContext context) {
    final user=context.watch<AppUserCubit>().state.user;
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      leadingWidth: 100,
      leading: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          Navigator.pop(context);
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 8, vertical: 15), // Optional padding for alignment
          child: Text(
            'Cancel',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500), // Consistent styling
          ),
        ),
      ),
      title: const Text(
        'Edit Profile',
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppPallete.grayColor), // Same styling as others
      ),
      actions: [
        BlocBuilder<EditProfileCubit, EditProfileState>(
          builder: (context, state) {
            return state.isEditing?const Padding(
              padding: EdgeInsets.all(5.0),
              child: CircularProgressIndicator(color: AppPallete.blackColor,),
            ): TextButton(
              onPressed: state.changedAttributes.isNotEmpty ? () {
                if(state.picturePicked != null) {
                  context.read<EditProfileCubit>().uploadImage(state.picturePicked!);
                }else {
                  context.read<EditProfileCubit>().submit(user!);
                }
              } : null,
              child: const Text(
                'Save',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500), // Consistent styling
              ),
            );
          },
        ),
      ],
    );
  }
}
