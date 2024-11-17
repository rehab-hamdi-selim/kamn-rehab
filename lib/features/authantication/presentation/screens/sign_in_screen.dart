import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/validators.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/authantication/data/data_source/sign_in_data_source.dart';
import 'package:kamn/features/authantication/presentation/cubits/sign_in_cubit.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/utils/show_snack_bar.dart';
import '../../data/repositories/sign_in_repository.dart';
import '../cubits/sign_in_state.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_feld.dart';
import '../widgets/facebook_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    emailController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(
          signInRepository: SignInRepository(
              remoteDataSource:
                  SignInDataSourceImpl(firestore: FirebaseFirestore.instance))),
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state.isFailure) {
            showSnackBar(context,state.erorrMessage??"");
          } else if (state.isSuccess) {
            print('success');
            //  Navigator.pushNamedAndRemoveUntil(context,
            //                       Routes.,
            //                       (Route<dynamic> route) => false,
            //                     );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.w, vertical: 30.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 24.h,
                                  color: AppPallete.lightBlackColor2,
                                ),
                                SizedBox(
                                  width: 11.w,
                                ),
                                Text(
                                  "Alexandria, Hadra ",
                                  style: TextStyles.font12lightBlackColor2Bold,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 65.h,
                            ),
                            Text(
                              "Let’s Sign You In",
                              style: TextStyles.fontRoboto24BoldBlack,
                            ),
                            Text(
                              "Welcome back, you’ve been missed!",
                              style: TextStyles.font14BlackColorMedium,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 65.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email or Username",
                              style: TextStyles
                                  .font17RobotoAccentBlackColor2Regular,
                            ),
                            CustomTextFormFeld(
                              validator: emailValidator,
                              hintText: "Enter your email",
                              keyboardType: TextInputType.emailAddress,
                              suffixIcon: const Icon(
                                Icons.email_outlined,
                                color: AppPallete.accentBlackColor2,
                              ),
                              controller: emailController,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              "Pawssword",
                              style: TextStyles
                                  .font17RobotoAccentBlackColor2Regular,
                            ),
                            CustomTextFormFeld(
                              validator: passwordValidator,
                              hintText: "Enter your password",
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: state.isVisible,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  context.read<SignInCubit>().changeVisiblePassword();

                                },
                                icon:  Icon(
                                  state.isVisible==true?
                                  Icons.remove_red_eye_outlined:Icons.visibility_off_outlined,
                                  color: AppPallete.accentBlackColor2,
                                ),
                              ),
                              controller: passwordController,
                            ),
                            Row(
                              children: [
                                Checkbox(value: false, onChanged: (value) {}),
                                Text(
                                  'Remember me for 30 days ',
                                  style: TextStyles
                                      .font11RobotoAccentBlackColor2Regular,
                                ),
                                const Spacer(),
                                InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyles
                                          .font11RobotoBlueColorRegular,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Column(
                        children: [
                          state.isLoading ? 
                          const CircularProgressIndicator(
                            color: AppPallete.darkVividVioletColor,
                          ):
                          CustomButton(
                            buttonText: 'Sign In',
                            onTapButton: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<SignInCubit>().signIn(
                                 email: emailController!.text,
                                 password:  passwordController!.text, 
                                );
                              }
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account? ',
                                style: TextStyles
                                    .font14RobotoLightBlackColorRegular,
                              ),
                              InkWell(
                                onTap: () {
                                   Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  Routes.signUpScreen,
                                  (Route<dynamic> route) => false,
                                );
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyles
                                      .font14RobotoLightBlackColorMedium,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 46.h,
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
          );
        },
      ),
    );
  }
}
