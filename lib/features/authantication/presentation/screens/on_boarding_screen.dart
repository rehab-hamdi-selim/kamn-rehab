import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/features/authantication/presentation/widgets/on_boarding/custom_logo_paint.dart';

import '../../../../core/routing/routes.dart';
import '../widgets/Custom_hader.dart';
import '../widgets/custom_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = 300.35.w;
    return Scaffold(
      body: Column(
        children: [
          //Add this CustomPaint widget to the Widget Tree
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: Size(
                          width,
                          (width * 1.5)
                              .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                      painter: RPSCustomPainter(),
                    ),
                    Positioned(
                      top: 140.h,
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
                bottom: 0,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(30.0).copyWith(right: 40),
                  child: const CustomHader(
                    boldText: "Welcome to KAMN !",
                    text:
                        "Book, train, and play your way to peak performance. Your game starts here!",
                  ),
                ),
              ),
            ],
          ),

          CustomButton(
            buttonText: 'Get Started',
            onTapButton: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.signInScreen,
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
