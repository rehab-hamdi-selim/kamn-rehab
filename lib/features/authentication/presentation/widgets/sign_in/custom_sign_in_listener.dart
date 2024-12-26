import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/features/authentication/presentation/cubits/sign_in_cubit/sign_in_view_model.dart';
import '../../../../../core/common/cubit/app_user/app_user_cubit.dart';
import '../../../../../core/utils/show_snack_bar.dart';
import '../../cubits/sign_in_cubit/sign_in_cubit.dart';
import '../../cubits/sign_in_cubit/sign_in_state.dart';

class CustomSignInListener extends StatelessWidget {
  final Widget child;
  const CustomSignInListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final appUserCubit = context.read<AppUserCubit>();
    final signInCubit = context.read<SignInCubit>();
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state.isFailure) {
          showSnackBar(context, state.erorrMessage ?? "");
        } else if (state.isSuccess) {
          signInCubit.getUser(uid: state.uid ?? "");
        } else if (state.isSuccessGetData) {
          appUserCubit.saveUserData(state.userModel);
        } else if (state.isFailureGetData) {
          signInCubit.signOut();
        } else if (state.isGoogleAuthSuccess) {
          signInCubit.setUserData(userModel: state.userModel!);// to firestore
        } else if (state.isDwrUserDataSuccess) {
          appUserCubit.saveUserData(state.userModel); // local
        }else if (state.isGoogleAuthFailure) {
          signInCubit.googleSignOut();
        }
      },
      child: child,
    );
  }
}
