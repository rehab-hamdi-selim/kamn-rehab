import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/admin/presentation/widgets/login_screen/custom_text_form_feild.dart';

class CustomTextFormPassword extends StatefulWidget {
  CustomTextFormPassword({required this.passwordController, super.key});

  TextEditingController passwordController;

  @override
  State<CustomTextFormPassword> createState() => _CustomTextFormPasswordState();
}

class _CustomTextFormPasswordState extends State<CustomTextFormPassword> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.w,
      height: 80.h,
      child: CustomTextFieldItem(
        fieldName: Constants.password,
        hintText: Constants.passwordHint,
        controller: widget.passwordController,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return Constants.pleasePassword;
          }
          if (value.trim().length < 6 || value.trim().length > 30) {
            return Constants.passwordShouldBe;
          }
          return null;
        },
        isObscure: isObscure,
        suffixIcon: InkWell(
          child:
              isObscure ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
          onTap: () {
            if (isObscure) {
              isObscure = false;
            } else {
              isObscure = true;
            }
            setState(() {});
          },
        ),
      ),
    );
  }
}
