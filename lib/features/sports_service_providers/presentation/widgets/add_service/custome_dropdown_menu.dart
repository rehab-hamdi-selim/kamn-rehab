import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomeDropdownMenu extends StatelessWidget {
  final String? hint;
  final Widget? prefixIcon;
  final List<String> choices;
  final TextEditingController controller;

  const CustomeDropdownMenu(
      {super.key,
      this.hint,
      this.prefixIcon,
      required this.choices,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        menuHeight: 400.h,
        menuStyle: MenuStyle(
            backgroundColor: MaterialStateProperty.all(AppPallete.lightColor)),
        selectedTrailingIcon: const Icon(Icons.keyboard_arrow_up_outlined),
        controller: controller,
        hintText: hint,
        width: double.infinity,
        leadingIcon: prefixIcon,
        trailingIcon: const Icon(Icons.keyboard_arrow_down_outlined),
        inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyles.fontInter14BlackMedium,
            hintStyle: TextStyles.font12GreyRegular,
            suffixIconColor: AppPallete.greyColor,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: AppPallete.greyColor,
                  width: 1,
                )),
            filled: true,
            fillColor: AppPallete.lightColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: AppPallete.lgGreyColor,
                width: 1,
              ),
            )),
        dropdownMenuEntries: choices.map((element) {
          return DropdownMenuEntry(value: element, label: element);
        }).toList());
  }
}
