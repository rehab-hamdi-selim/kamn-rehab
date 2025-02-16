import 'package:flutter/material.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/font_weight_helper.dart';

class MonthTextField extends StatelessWidget {
  const MonthTextField({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 17),
        child: Container(
            padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4),
            decoration: const BoxDecoration(
                color: AppPallete.ofWhiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                )),
            child: const TextField(
              decoration: InputDecoration(
                  hintText: 'Month',
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontWeight: FontWeightHelper.light)),
            )),
      ),
    );
  }
}
