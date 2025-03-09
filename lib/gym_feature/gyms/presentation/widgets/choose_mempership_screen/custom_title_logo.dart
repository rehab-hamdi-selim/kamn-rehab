import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/style.dart';

class CustomTitleLogo extends StatelessWidget {
  const CustomTitleLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Choose Membership Plan",
            style: TextStyles.fontCircularSpotify20BlackMedium),
        Text(
          "Select a plan that suits your fitness goals!",
          style: TextStyles.fontCircularSpotify10AccentBlackColorMedium,
        ),
        SizedBox(height: 30.h),
        Center(
          child: CircleAvatar(
            radius: 30.w, // Responsive radius using ScreenUtil
            backgroundColor:
                Colors.transparent, // Optional: Transparent background
            child: SvgPicture.network(
              "https://cdn.brandfetch.io/idzjac_teo/theme/dark/logo.svg?c=1dxbfHSJFAPEGdCLU4o5B",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          "Gold's Gym",
          textAlign: TextAlign.center,
          style: TextStyles.fontCircularSpotify20BlackMedium,
        ),
        Text("@goldsgymalex",
            textAlign: TextAlign.center,
            style: TextStyles.fontCircularSpotify10AccentBlackColorMedium),
      ],
    );
  }
}
