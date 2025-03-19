import 'package:flutter/material.dart';
import 'package:kamn/core/theme/style.dart';

class CustomeTitleText extends StatelessWidget {
  final String title;
  final String type;
  const CustomeTitleText({super.key, required this.title, required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyles.fontRoboto16BlackRegular,
        ),
        Text(
          type,
          style: TextStyles.fontRoboto10RegularGray,
        ),
      ],
    );
  }
}
