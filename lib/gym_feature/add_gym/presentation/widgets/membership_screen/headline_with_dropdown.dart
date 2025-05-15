import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class HeadlineWithDropdown extends StatelessWidget {
  const HeadlineWithDropdown({
    super.key,
    required this.headLine,
    required this.subtitle,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.optionalText,
    this.value,
  });

  final String headLine;
  final String subtitle;
  final String hintText;
  final String? optionalText;
  final String? value;
  final List<String> items;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: headLine),
                TextSpan(
                  text: optionalText,
                  style: TextStyles.fontCircularSpotify12GrayRegular
                ),
              ],
            ),
            textAlign: TextAlign.center,
            style: TextStyles.fontCircularSpotify16BlackMedium.copyWith(
              color: AppPallete.accentBlackColor,
            ),
          ),
          Text(
            subtitle,
            style: TextStyles.fontCircularSpotify10darkGreyColorRegular.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 6.h),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(11.75.h),
              border: Border.all(
                width: 0.50,
                color: AppPallete.witeColorShade,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 14.89.h),
            child: DropdownButton<String>(
              value: value,
              hint: Text(
                hintText,
                style: TextStyles.fontCircularSpotify12GrayRegular,
              ),
              isExpanded: true,
              underline: const SizedBox(),
              icon: const Icon(Icons.keyboard_arrow_down),
              borderRadius: BorderRadius.circular(8.r),
              style: TextStyles.fontCircularSpotify12BlackRegular,
              dropdownColor: Colors.white,
              elevation: 3,
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}