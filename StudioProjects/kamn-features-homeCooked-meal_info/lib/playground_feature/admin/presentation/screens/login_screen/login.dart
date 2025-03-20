import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/playground_feature/admin/presentation/widgets/login_screen/custom_elevation_button.dart';
import 'package:kamn/playground_feature/admin/presentation/widgets/login_screen/custom_text_form_name.dart';
import 'package:kamn/playground_feature/admin/presentation/widgets/login_screen/custom_text_form_password.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppPallete.whiteColor,
        //Theme.of(context).primaryColor,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 91.h, bottom: 20.h, left: 97.w, right: 97.w),
                child: Image.asset(
                  width: 251,
                  height: 163,
                  ImageLinks.loginLogo,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(Constants.login,
                        style: TextStyles.fontInter24BlackMedium),
                    Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            CustomTextFormName(emailController: nameController),
                            verticalSpace(30),
                            CustomTextFormPassword(
                                passwordController: passwordController)
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(8),
                    Text(
                      Constants.forgetPassword,
                      style: TextStyles.fontInter14BlackMedium,
                      textAlign: TextAlign.end,
                    ),
                    verticalSpace(200),
                    const CustomElevationButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
