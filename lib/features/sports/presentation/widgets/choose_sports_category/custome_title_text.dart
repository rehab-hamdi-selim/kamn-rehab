import 'package:flutter/material.dart';
import 'package:kamn/core/theme/style.dart';

class CustomeTitleText extends StatelessWidget {
  String title;
  String type;
  CustomeTitleText({super.key, required this.title, required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyles.fontRoboto16RegularBlack,
        ),
        Text(
          type,
          style: TextStyles.fontRoboto10RegularGray,
        ),
      ],
    );
  }
}
