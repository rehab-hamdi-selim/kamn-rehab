import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';

class CustomDottedBorder extends StatelessWidget {
  const CustomDottedBorder({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
    radius: Radius.circular(12.r),
    borderType: BorderType.RRect,
    color: AppPallete.stealGray,
    strokeWidth: 0.5,
    dashPattern: const [16, 16],
    child: child,
  );
  }
}