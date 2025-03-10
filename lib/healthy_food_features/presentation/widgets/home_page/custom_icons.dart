import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomIcons extends StatelessWidget {
  const CustomIcons({super.key, required this.image, required this.index});

  final String image;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32.w,
      height: 32.33.h,
      child: Stack(
        children: [
          Positioned(
              left: 0,
              top: 0.33,
              child: Container(
                width: 32.w,
                height: 32.h,
                padding: const EdgeInsets.all(4),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              )),
          Positioned(
            left: 3,
            top: 4.67,
            child: Container(
              width: 24.w,
              height: 24.h,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              child: SvgPicture.asset(image),
            ),
          ),
          Positioned(
            left: 16,
            top: 0,
            child: Container(
              width: 16.w,
              height: 16.h,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              decoration: ShapeDecoration(
                color: AppPallete.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                index.toString(),
                style: TextStyles.circularSpotify10BoldWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
