import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox verticalSpace(double height) => SizedBox(
      height: height.h,
    );

SizedBox horizontalSpace(double width) => SizedBox(
      width: width.w,
    );

Divider divider(double endIndent, double indent, {double? thick}) => Divider(
      endIndent: endIndent.w,
      indent: indent.w,
      thickness: thick,
    );
