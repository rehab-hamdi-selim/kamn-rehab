import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_pallete.dart';
import '../cubits/sign_up_cubit/sign_up_cubit.dart';
import '../cubits/sign_up_cubit/sign_up_state.dart';
import '../widgets/custom_button.dart';
import '../widgets/sign_up/custome_already_have_an_account_row.dart';
import '../widgets/sign_up/custome_sign_up_input_fields.dart';
import '../widgets/sign_up/custome_sign_up_listner.dart';
import '../widgets/sign_up/custome_upper_text.dart';
import '../widgets/sign_up/google_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return CustomeSignUpListner(
      child: Scaffold(
        backgroundColor: AppPallete.whiteColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: cubit.signUpViewModel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomeUpperText(),
                  SizedBox(height: 15.h),
                  CustomeSignUpInputFields(cubit: cubit.signUpViewModel),
                  SizedBox(height: 27.h),
                  Column(
                    children: [
                      BlocBuilder<SignUpCubit, SignUpState>(
                        builder: (context, state) {
                          return state.isLoading
                              ? const CircularProgressIndicator(
                                  color: AppPallete.darkVividVioletColor,
                                )
                              : CustomButton(
                                  buttonText: 'Sign Up',
                                  onTapButton: () {
                                    if (state.isChecked == true) {
                                      if (cubit
                                          .signUpViewModel.formKey.currentState!
                                          .validate()) {
                                        cubit.signUp(
                                          name: cubit.signUpViewModel
                                              .nameController!.text,
                                          email: cubit.signUpViewModel
                                              .emailController!.text,
                                          password: cubit.signUpViewModel
                                              .passwordController!.text,
                                          type: 'normal',
                                        );
                                      }
                                    } else {
                                      showSnackBar(context,
                                          'Please accept terms and conditions');
                                    }
                                  },
                                );
                        },
                      ),
                      SizedBox(height: 10.h),
                      CustomeAlreadyHaveAnAccountRow(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.signInScreen,
                            (route) => false,
                          );
                        },
                      ),
                      SizedBox(height: 22.h),
                      GoogleButton(onTapButton: () {}),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
