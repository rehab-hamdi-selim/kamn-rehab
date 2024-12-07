import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/features/authentication/presentation/cubits/sign_up_cubit/sign_up_state.dart';
import 'package:kamn/features/authentication/presentation/widgets/sign_up/custome_upper_text.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_pallete.dart';

import '../cubits/sign_up_cubit/sign_up_cubit.dart';
import '../widgets/custom_button.dart';
import '../widgets/sign_up/custome_already_have_an_account_row.dart';
import '../widgets/sign_up/custome_sign_up_input_fields.dart';
import '../widgets/sign_up/custome_sign_up_listner.dart';
import '../widgets/sign_up/facebook_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>().signUpViewModel;

    return CustomeSignUpListner(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: cubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomeUpperText(),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomeSignUpInputFields(cubit: cubit),
                  SizedBox(
                    height: 27.h,
                  ),
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
                                    if (cubit.formKey.currentState!
                                        .validate()) {
                                      context.read<SignUpCubit>().signUp(
                                            name: cubit.nameController!.text,
                                            email: cubit.emailController!.text,
                                            password:
                                                cubit.passwordController!.text,
                                          );
                                    }
                                  },
                                );
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomeAlreadyHaveAnAccountRow(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.signInScreen,
                            (Route<dynamic> route) => false,
                          );
                        },
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                      FacebookButton(
                        onTapButton: () {},
                      ),
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
