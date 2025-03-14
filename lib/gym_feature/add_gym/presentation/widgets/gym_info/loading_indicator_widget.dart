import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 37.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 14.w,
            height: 14.h,
            child: const CircularProgressIndicator(
              color: AppPallete.mediumLightGray,
              semanticsLabel: 'Loading...',
              strokeWidth: 1,
            ),
          ),
          horizontalSpace(5),
          Text(
            'Loading...',
            style: TextStyles.fontCircularSpotify14GrayRegular,
          ),
        ],
      ),
    );
  }
}