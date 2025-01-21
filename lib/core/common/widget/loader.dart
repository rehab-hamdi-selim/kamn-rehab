import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200.w,
        height: 200.h,
        child: const RiveAnimation.asset(
          "assets/images/loading.riv",
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
