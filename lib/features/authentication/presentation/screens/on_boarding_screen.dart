import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/features/authentication/presentation/widgets/on_boarding/custom_logo_paint.dart';

import '../../../../core/routing/routes.dart';
import '../widgets/Custom_hader.dart';
import '../widgets/custom_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

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
                    const CustomHader(
                      boldText: "Welcome to KAMN !",
                      text:
                          "Book, train, and play your way to peak performance. Your game starts here!",
                    ),
                    verticalSpace(48.h),
                    CustomButton(
                      buttonText: 'Get Started',
                      onTapButton: () {
                        Navigator.pushNamed(
                          context,
                          Routes.signInScreen,
                        );
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
