import 'package:flutter/material.dart';
import 'package:kamn/core/theme/app_pallete.dart';

class CustomSearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final String hintText;
  final TextEditingController? controller;

  const CustomSearchBar({
    super.key,
    this.onChanged,
    this.onSubmitted,
    required this.hintText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppPallete.tooLightGray,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppPallete.tooLightGray,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppPallete.tooLightGray,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        label: Text(
          hintText,
          style: const TextStyle(
            color: AppPallete.lightGreyColor,
          ),
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: AppPallete.lightGrey,
        ),
      ),
    );
  }
}
