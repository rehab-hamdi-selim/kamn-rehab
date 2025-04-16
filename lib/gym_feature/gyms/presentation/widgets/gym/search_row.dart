import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 270.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppPallete.lgGreyColor)),
          child: TextField(
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 10),
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: TextStyles.fontCircularSpotify12GrayRegular,
                prefixIcon: Padding(
                  padding:  EdgeInsets.only(
                    top: 13.h,
                    left: 15.w,
                    right: 9.w,
                    bottom: 13.h,
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/search.svg",
                    width: 13.w,
                    height: 13.h,
                    color: AppPallete.lgGreyColor,
                  ),
                )),
          ),
        ),
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                padding:
                     EdgeInsets.symmetric(horizontal: 7.5.h, vertical: 9.w),
                minimumSize: const Size(80, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                iconColor: Colors.white,
                backgroundColor: AppPallete.blackColor),
            icon:
                SvgPicture.asset(color: Colors.white, "assets/icons/edit.svg"),
            onPressed: () {},
            label: Text(
              "Filter",
              style: TextStyles.fontCircularSpotify11LightRegular,
            ))
      ],
    );
  }
}
