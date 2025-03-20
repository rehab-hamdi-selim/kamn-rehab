import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget customPositionedBtns({
  required double topPosition,
  double? leftPosition,
  double? rightPosition,
  required Function() onTap,
  required String icon,
}) {
  return Positioned(
    top: topPosition.h,
    left: leftPosition != null ? leftPosition.w : null,
    right: rightPosition != null ? rightPosition.w : null,
    child: IconButton(
      onPressed: onTap,
      icon: SvgPicture.asset(
        icon,
        width: 24.w,
        height: 24.h,
      ),
    ),
  );
}
