import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class LocationContainer extends StatelessWidget {
  const LocationContainer({
    super.key, required this.location,
  });
  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
      decoration: BoxDecoration(
          color: AppPallete.shadeOfGray,
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
           Icon(
            Icons.location_on_outlined,
            size: 10.r,
          ),
          Text(
            location,
            style: TextStyles.fontCircularSpotify8AccentBlackRegular,
          ),
        ],
      ),
    );
  }
}
