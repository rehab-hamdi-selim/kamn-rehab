import 'package:flutter/material.dart';
import '../../../../core/theme/style.dart';

class CustomHader extends StatelessWidget {
  final String boldText;
  final String text;
  const CustomHader({super.key,required this.boldText,required this.text});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(boldText,
        style: TextStyles.fontRoboto24BoldBlack,
        ),
        Text(text,
        style: TextStyles.font14BlackColorMedium,
        textAlign:TextAlign.center ,
        ),
      ],
    );
  }
}