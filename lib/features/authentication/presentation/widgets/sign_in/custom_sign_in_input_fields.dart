import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/validators.dart';
import '../../../../../core/theme/app_pallete.dart';
import '../../../../../core/theme/style.dart';
import '../../cubits/sign_in_cubit/sign_in_cubit.dart';
import '../../cubits/sign_in_cubit/sign_in_state.dart';
import '../../cubits/sign_in_cubit/sign_in_view_model.dart';
import '../custom_text_form_feld.dart';

class CustomSignInInputFields extends StatelessWidget {
  final SignInViewModel viewModel;

  const CustomSignInInputFields({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email",
            style: TextStyles.font17RobotoAccentBlackColor2Regular,
          ),
          CustomTextFormFeld(
            validator: emailValidator,
            hintText: "Enter your email",
            keyboardType: TextInputType.emailAddress,
            suffixIcon: const Icon(
              Icons.email_outlined,
              color: AppPallete.accentBlackColor2,
            ),
            controller: viewModel.emailController,
          ),
          SizedBox(height: 15.h),
          Text(
            "Password",
            style: TextStyles.font17RobotoAccentBlackColor2Regular,
          ),
          BlocBuilder<SignInCubit, SignInState>(
            builder: (context, state) {
              return CustomTextFormFeld(
                validator: passwordValidator,
                hintText: "Enter your password",
                obscureText: state.isVisible,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    context.read<SignInCubit>().changeVisiblePassword();
                  },
                  icon: Icon(
                    state.isVisible
                        ? Icons.remove_red_eye_outlined
                        : Icons.visibility_off_outlined,
                    color: AppPallete.accentBlackColor2,
                  ),
                ),
                controller: viewModel.passwordController,
              );
            },
          ),
        ],
      ),
    );
  }
}
