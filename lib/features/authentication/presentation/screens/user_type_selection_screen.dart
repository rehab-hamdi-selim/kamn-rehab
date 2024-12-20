import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/features/authentication/presentation/widgets/on_boarding/custom_logo_paint.dart';

import '../../../../core/routing/routes.dart';
import '../widgets/Custom_hader.dart';
import '../widgets/custom_button.dart';

class UserTypeSelectionScreen extends StatefulWidget {
  const UserTypeSelectionScreen({super.key});

  @override
  State<UserTypeSelectionScreen> createState() =>
      _UserTypeSelectionScreenState();
}

class _UserTypeSelectionScreenState extends State<UserTypeSelectionScreen> {
  String? selectedUserType; // Holds the selected user type

  void selectUserType(String userType) {
    setState(() {
      selectedUserType = userType;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = 300.35.w;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppPallete.whiteColor,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: Size(
                        width,
                        (673.h)
                            .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: RPSCustomPainter(),
                  ),
                  Positioned(
                    top: 130.h,
                    child: Image.asset(
                      "assets/images/loginLogo.png",
                      height: 213.h,
                      width: 328.w,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 554.h,
              width: 375.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => selectUserType('normal'),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: selectedUserType == 'normal'
                                  ? Colors.blue.shade100
                                  : Colors.white,
                              border: Border.all(
                                color: selectedUserType == 'normal'
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.person, color: Colors.blue),
                                SizedBox(width: 8),
                                Text(
                                  'Normal User',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: selectedUserType == 'normal'
                                        ? Colors.blue
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: () => selectUserType('service_provider'),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: selectedUserType == 'service_provider'
                                  ? Colors.green.shade100
                                  : Colors.white,
                              border: Border.all(
                                color: selectedUserType == 'service_provider'
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.business, color: Colors.green),
                                SizedBox(width: 8),
                                Text(
                                  'Service Provider',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color:
                                        selectedUserType == 'service_provider'
                                            ? Colors.green
                                            : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(48.h),
                    CustomButton(
                      buttonText: 'Choose Your role',
                      onTapButton: () {
                        if (selectedUserType != null) {
                          Navigator.pushNamed(context, Routes.signUpScreen,
                              arguments: selectedUserType);
                        } else {
                          showSnackBar(context, 'please select your type');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
