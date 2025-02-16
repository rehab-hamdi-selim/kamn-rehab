import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/validators.dart';
import '../../../../../core/theme/app_pallete.dart';
import '../../../../../core/theme/style.dart';
import '../../cubits/sign_up_cubit/sign_up_cubit.dart';
import '../../cubits/sign_up_cubit/sign_up_state.dart';
import '../../cubits/sign_up_cubit/sign_up_view_model.dart';
import '../custom_text_form_feld.dart';

class CustomeSignUpInputFields extends StatelessWidget {
  final SignUpViewModel cubit;
  const CustomeSignUpInputFields({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
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
            controller: cubit.emailController,
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            "Username",
            style: TextStyles.font17RobotoAccentBlackColor2Regular,
          ),
          CustomTextFormFeld(
            validator: (String? value) {
              if (value == null || value.trim().isEmpty) {
                return "Plase enter your username";
              }
              return null;
            },
            hintText: "Enter your Username",
            keyboardType: TextInputType.emailAddress,
            suffixIcon: const Icon(
              Icons.person,
              color: AppPallete.accentBlackColor2,
            ),
            controller: cubit.nameController,
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            "Pawssword",
            style: TextStyles.font17RobotoAccentBlackColor2Regular,
          ),
          BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return CustomTextFormFeld(
                validator: passwordValidator,
                hintText: "Enter your password",
                obscureText: state.isVisiblePassword,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    context.read<SignUpCubit>().changeVisiblePassword();
                  },
                  icon: Icon(
                    state.isVisiblePassword == true
                        ? Icons.remove_red_eye_outlined
                        : Icons.visibility_off_outlined,
                    color: AppPallete.accentBlackColor2,
                  ),
                ),
                controller: cubit.passwordController,
              );
            },
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            "Confirm Password",
            style: TextStyles.font17RobotoAccentBlackColor2Regular,
          ),
          BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return CustomTextFormFeld(
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return "please enter your Confirm Password";
                  } else if (value != cubit.passwordController!.text) {
                    return "Password and Confirm Password must be same";
                  }
                  return null;
                },
                hintText: "Enter your Confirm Password",
                keyboardType: TextInputType.visiblePassword,
                obscureText: state.isVisiblePasswordConfirm,
                suffixIcon: IconButton(
                  onPressed: () {
                    context.read<SignUpCubit>().changeVisibleConfirmPassword();
                  },
                  icon: Icon(
                    state.isVisiblePasswordConfirm == true
                        ? Icons.remove_red_eye_outlined
                        : Icons.visibility_off_outlined,
                    color: AppPallete.accentBlackColor2,
                  ),
                ),
                controller: cubit.confirmPasswordController,
              );
            },
          ),
          Row(
            children: [
              BlocBuilder<SignUpCubit, SignUpState>(
                builder: (context, state) {
                  return Checkbox(
                      value: state.isChecked,
                      onChanged: (value) {
                        context.read<SignUpCubit>().check(value!);
                      });
                },
              ),
              Text(
                'By creating an account, you agree to our',
                style: TextStyles.font11RobotoAccentBlackColor2Regular
                    .copyWith(fontSize: 10.h),
              ),
              InkWell(
                  onTap: () {},
                  child: Text(
                    'Term & Conditions',
                    style: TextStyles.font11RobotoBlueColorRegular
                        .copyWith(fontSize: 10.h),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
