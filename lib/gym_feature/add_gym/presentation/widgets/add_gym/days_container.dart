import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class DaysContainer extends StatelessWidget {
  DaysContainer({super.key});

  final List<String> days = ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"];

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      elevation: 2,
      child: Wrap(
        children: days.map((day) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 11.h),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text(
              day,
              style: TextStyles.fontCircularSpotify12BlackMedium.copyWith(
                color: AppPallete.darkGreyColor,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
