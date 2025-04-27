import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/const/icon_links.dart';
import 'package:kamn/core/theme/app_pallete.dart';

class CircularBackButton extends StatelessWidget {
  const CircularBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16.r,
          backgroundColor: AppPallete.accentBlackColor,
          child: Center(
            child: SvgPicture.asset(
              height: 10.h,
              width: 10.w,
              IconLinks.arrow,
            ),
          ),
        ),
      ],
    );
  }
}
