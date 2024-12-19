import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../data/data_source/auth_remote_data_source.dart';
import '../../data/repositories/auth_repository.dart';
import '../cubits/sign_in_cubit/sign_in_cubit.dart';
import '../cubits/sign_in_cubit/sign_in_state.dart';
import '../cubits/sign_in_cubit/sign_in_view_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/sign_in/custom_dont_have_account_row.dart';
import '../widgets/sign_in/custom_sign_in_input_fields.dart';
import '../widgets/sign_in/custom_sign_in_listener.dart';
import '../widgets/sign_up/google_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(
        authRepository: AuthRepositoryImpl(
          authDataSource:
              AuthRemoteDataSourceImpl(firestore: FirebaseFirestore.instance),
        ),
        signInViewModel: SignInViewModel(),
      ),
      child: Builder(builder: (context) {
        final viewModel = context.read<SignInCubit>().signInViewModel;

        return CustomSignInListener(
          child: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSignInInputFields(viewModel: viewModel),
                      SizedBox(height: 27.h),
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
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                Routes.signUpScreen,
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
      }),
    );
  }
}
