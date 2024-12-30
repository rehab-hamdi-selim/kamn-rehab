import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:kamn/features/authentication/presentation/widgets/sign_in/custome_title_text.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_pallete.dart';
import '../cubits/sign_in_cubit/sign_in_cubit.dart';
import '../cubits/sign_in_cubit/sign_in_state.dart';
import '../widgets/custom_button.dart';
import '../widgets/sign_in/custom_dont_have_account_row.dart';
import '../widgets/sign_in/custom_sign_in_input_fields.dart';
import '../widgets/sign_in/custom_sign_in_listener.dart';
import '../widgets/sign_up/google_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SignInCubit>().signInViewModel;

    return CustomSignInListener(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: AppPallete.whiteColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomeTitleText(),
                    CustomSignInInputFields(viewModel: viewModel),
                    SizedBox(height: 120.h),
                    Column(
                      children: [
                        BlocBuilder<SignInCubit, SignInState>(
                          builder: (context, state) {
                            return state.isLoading
                                ? const CircularProgressIndicator(
                                    color: AppPallete.darkVividVioletColor,
                                  )
                                : CustomButton(
                                    buttonText: 'Sign In',
                                    onTapButton: () {
                                      if (viewModel.formKey.currentState!
                                          .validate()) {
                                        context.read<SignInCubit>().signIn(
                                              email: viewModel
                                                  .emailController!.text,
                                              password: viewModel
                                                  .passwordController!.text,
                                            );
                                      }
                                    },
                                  );
                          },
                        ),
                        SizedBox(height: 10.h),
                        CustomDontHaveAccountRow(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.signUpScreen,
                            );
                          },
                        ),
                        SizedBox(height: 22.h),
                        BlocBuilder<SignInCubit, SignInState>(
                          builder: (context, state) {
                            return state.isGoogleAuthLoading
                                ? const CircularProgressIndicator(
                                    color: AppPallete.darkVividVioletColor,
                                  )
                                : GoogleButton(onTapButton: () {
                                    context.read<SignInCubit>().googleAuth();
                                  });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
