import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/validators.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/theme/style.dart';
import '../../../../core/utils/show_snack_bar.dart';
import '../../data/data_source/sign_up_data_source.dart';
import '../../data/repositories/sign_up_repository.dart';
import '../cubits/sign_up_cubit.dart';
import '../cubits/sign_up_state.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_feld.dart';
import '../widgets/facebook_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? nameController = TextEditingController();
  TextEditingController? confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController?.dispose();
    passwordController?.dispose();
    nameController?.dispose();
    confirmPasswordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(
          signUpRepository: SignUpRepositoryImpl(
        firestore: FirebaseFirestore.instance,
        signUpDataSource:
            SignUpDataSourceImpl(firestore: FirebaseFirestore.instance),
      )),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state.isFailure) {
            showSnackBar(context, state.erorrMessage ?? "");
            print(state.erorrMessage);
          } else if (state.isSuccess) {
            context.read<SignUpCubit>().setData(authUserModel: state.userModel!);
            showSnackBar(context, "Sign Up Successfully");
          }else if (state.isFailureSaveData) {
            state.erorrMessage;
            context.read<SignUpCubit>().deleteUser(uid: state.userModel?.uid??"");
            ///TODO: delete account
            showSnackBar(context, state.erorrMessage??"error");
          }else if (state.isSuccessSaveData) {
            showSnackBar(context, "save data Successfully");
            ///TODO: navigate to home screen
           
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
                              height: 15.h,
                            ),
                            Text(
                              "Getting Started",
                              style: TextStyles.fontRoboto24BoldBlack,
                            ),
                            Text(
                              "Create an account to continue!",
                              style: TextStyles.font14BlackColorMedium,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
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
                              "Username",
                              style: TextStyles
                                  .font17RobotoAccentBlackColor2Regular,
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
                                Icons.email_outlined,
                                color: AppPallete.accentBlackColor2,
                              ),
                              controller: nameController,
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
                              obscureText: state.isVisiblePassword,
                              keyboardType: TextInputType.visiblePassword,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  context
                                      .read<SignUpCubit>()
                                      .changeVisiblePassword();
                                },
                                icon: Icon(
                                  state.isVisiblePassword == true
                                      ? Icons.remove_red_eye_outlined
                                      : Icons.visibility_off_outlined,
                                  color: AppPallete.accentBlackColor2,
                                ),
                              ),
                              controller: passwordController,
                            ),
                            Text(
                              "Confirm Password",
                              style: TextStyles
                                  .font17RobotoAccentBlackColor2Regular,
                            ),
                            CustomTextFormFeld(
                              validator: (String? value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "please enter your Confirm Password";
                                } else if (value != passwordController!.text) {
                                  return "Password and Confirm Password must be same";
                                }
                                return null;
                              },
                              hintText: "Enter your Confirm Password",
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: state.isVisiblePasswordConfirm,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  context
                                      .read<SignUpCubit>()
                                      .changeVisibleConfirmPassword();
                                },
                                icon: Icon(
                                  state.isVisiblePasswordConfirm == true
                                      ? Icons.remove_red_eye_outlined
                                      : Icons.visibility_off_outlined,
                                  color: AppPallete.accentBlackColor2,
                                ),
                              ),
                              controller: confirmPasswordController,
                            ),
                            Row(
                              children: [
                                Checkbox(value: false, onChanged: (value) {}),
                                Text(
                                  'By creating an account, you agree to our',
                                  style: TextStyles
                                      .font11RobotoAccentBlackColor2Regular
                                      .copyWith(fontSize: 10.h),
                                ),
                                InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'Term & Conditions',
                                      style: TextStyles
                                          .font11RobotoBlueColorRegular
                                          .copyWith(fontSize: 10.h),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 27.h,
                      ),
                      Column(
                        children: [
                          state.isLoading
                              ? const CircularProgressIndicator(
                                  color: AppPallete.darkVividVioletColor,
                                )
                              : CustomButton(
                                  buttonText: 'Sign Up',
                                  onTapButton: () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<SignUpCubit>().signUp(
                                            name: nameController!.text,
                                            email: emailController!.text,
                                            password: passwordController!.text,
                                          );
                                    }
                                  },
                                ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account? ',
                                style: TextStyles
                                    .font14RobotoLightBlackColorRegular,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    Routes.signInScreen,
                                    (Route<dynamic> route) => false,
                                  );
                                },
                                child: Text(
                                  'Sign In',
                                  style: TextStyles
                                      .font14RobotoLightBlackColorMedium,
                                ),
                              ),
                            ],
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
          );
        },
      ),
    );
  }
}
