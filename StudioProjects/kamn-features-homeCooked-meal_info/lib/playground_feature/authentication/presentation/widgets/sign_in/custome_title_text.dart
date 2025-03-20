import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/style.dart';

class CustomeTitleText extends StatelessWidget {
  const CustomeTitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 148.h, bottom: 65.h, left: 35.w, right: 35.w),
      child: Column(
        children: [
          Text(
            'Let’s Sign You In',
            style: TextStyles.fontRoboto32BlackMedium
                .copyWith(fontWeight: FontWeight.w700),
          ),
          Text(
            'Welcome back, you’ve been missed!',
            style: TextStyles.fontRoboto14BlackMedium,
          ),
        ],
      ),
    );
  }
}
