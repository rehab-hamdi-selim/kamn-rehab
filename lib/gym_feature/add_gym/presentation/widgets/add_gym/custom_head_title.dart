import 'package:flutter/material.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';

class CustomHeadTitle extends StatelessWidget {
  const CustomHeadTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Add Gym",
          style: TextStyles.fontCircularSpotify21BlackMedium,
        ),
        verticalSpace(2),
        Text(
          "Basic Gym Information",
          style: TextStyles.fontCircularSpotify10Gray2Regular,
        ),
      ],
    );
  }
}
