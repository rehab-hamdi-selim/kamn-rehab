import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';

class CustomTopRatedItemLeftSection extends StatelessWidget {
  const CustomTopRatedItemLeftSection(
      {super.key, required this.gymPrice, required this.gymDuration});
  final String gymPrice;
  final String gymDuration;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Image(image: AssetImage(ImageLinks.gymImage)),
        verticalSpace(20.h),
        RichText(
            text: TextSpan(
                text: '$gymPrice £GP/',
                style: TextStyles.fontCircularSpotify10RegularAccentMedium,
                children: [
              TextSpan(
                  text: gymDuration,
                  style: TextStyles.fontCircularSpotify10RegularAccentLight),
            ])),
      ],
    );
  }
}
