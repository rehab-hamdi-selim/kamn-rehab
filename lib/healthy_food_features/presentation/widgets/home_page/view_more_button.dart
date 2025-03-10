import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class ViewMoreButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ViewMoreButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Text(
            'View more',
            textAlign: TextAlign.center,
            style: TextStyles.fontCircularSpotify12BlackRegular,
          ),
          SizedBox(width: 4.w),
          Icon(
            Icons.arrow_forward_ios,
            size: 16.h,
            color: AppPallete.darkGreenColor,
          ),
        ],
      ),
    );
  }
}
