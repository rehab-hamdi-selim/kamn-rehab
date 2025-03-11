import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/image_links.dart';

class CustomReservationBackgroundImage extends StatelessWidget {
  const CustomReservationBackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            ImageLinks.groundImage,
            fit: BoxFit.fitWidth,
            height: 110.h,
            width: double.infinity,
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.41),
            ),
          ),
        ),
      ],
    );
  }
}
