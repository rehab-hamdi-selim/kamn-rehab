import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';

import '../../../../core/theme/style.dart';

class FacebookButton extends StatelessWidget {
 final  void Function()? onTapButton;
  const FacebookButton({super.key,required this.onTapButton});

  @override
  Widget build(BuildContext context) {
        return InkWell(
        onTap: onTapButton,
        child: Container(
          height: 44.h,
          width: 305.w,
          decoration:  BoxDecoration(
            color: AppPallete.lgWhiteColor,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.facebook, color: AppPallete.darkBlueColor),
              Text("Connect with Facebook",
                  style: TextStyles.font14RobotoDarkBlueColorMedium),
            ],
          ),
        ),
      );
  }
}