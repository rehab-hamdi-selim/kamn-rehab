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
                hintStyle: TextStyles.fontCircularSpotify10GrayRegular,
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppPallete.lgGreyColor,
                )),
          ),
        ),
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
