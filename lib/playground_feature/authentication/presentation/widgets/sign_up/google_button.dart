import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kamn/core/const/icon_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';

import '../../../../../core/theme/style.dart';

class GoogleButton extends StatelessWidget {
  final void Function()? onTapButton;
  const GoogleButton({super.key, required this.onTapButton});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapButton,
      child: Container(
        height: 44.h,
        width: 305.w,
        decoration: BoxDecoration(
          color: AppPallete.lgWhiteColor,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(IconLinks.google),
            horizontalSpace(3),
            Text("Connect with Google",
                style: TextStyles.font14RobotoDarkGreenColorMedium),
          ],
        ),
      ),
    );
  }
}
