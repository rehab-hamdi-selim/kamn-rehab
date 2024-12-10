import 'package:flutter/material.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/font_weight_helper.dart';

class YearTextField extends StatelessWidget {
  const YearTextField({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: EdgeInsets.only(left: 8, top: 4, bottom: 4),
          decoration: const BoxDecoration(
              color: AppPallete.ofWhiteColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
          child: const TextField(
            decoration: InputDecoration(
                hintText: 'Year',
                border: InputBorder.none,
                hintStyle: TextStyle(fontWeight: FontWeightHelper.light)),
          )),
    );
  }
}
