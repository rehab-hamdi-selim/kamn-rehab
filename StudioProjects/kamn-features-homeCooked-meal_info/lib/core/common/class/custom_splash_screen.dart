import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/playground_feature/authentication/presentation/widgets/on_boarding/custom_logo_paint.dart';

class CustomSplashScreen extends StatelessWidget {
  const CustomSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppPallete.whiteColor,
      child: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 35.h,
              child: CustomPaint(
                size: Size(375.w, 812.h),
                painter: RPSCustomPainter(),
              ),
            ),
            Positioned(
              top: 130.h,
              child: Image.asset(
                "assets/images/loginLogo.png",
                height: 400.h,
                width: 328.w,
              )
                  .animate() // Add animation to the widget
                  .fadeIn(
                      duration: 1.seconds,
                      curve: Curves.easeIn), // Fade-in animation
            ),
          ],
        ).animate().fadeIn(duration: 1.seconds, curve: Curves.easeIn),
      ),
    ); // Fade-in for the entire container
  }
}
