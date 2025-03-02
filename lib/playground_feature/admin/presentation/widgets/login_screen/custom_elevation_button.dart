import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomElevationButton extends StatelessWidget {
  const CustomElevationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 308,
      
      child: ElevatedButton(
        onPressed: () {
          //todo: login
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: AppPallete.violetColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.r)))),
        child: SizedBox(
          height: 64.h,
          width: 398.w,
          child: Center(
            child: Text(Constants.signUp,
                style: TextStyles.fontInter24BlackMedium),
          ),
        ),
      ),
    );
  }
}
