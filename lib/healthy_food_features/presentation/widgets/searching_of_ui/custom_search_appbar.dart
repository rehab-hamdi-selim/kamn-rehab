import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/const/icon_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/searching_of_ui/custom_search_dropodwn.dart';

Widget CustomSearchAppbar() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        icon: SvgPicture.asset(
          IconLinks.backArrow,
          width: 24.w,
          height: 24.h,
        ),
      ),
      horizontalSpace(10.5.w),
      CustomSearchDropodwn(),
      horizontalSpace(41.w),
      IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        icon: SvgPicture.asset(
          IconLinks.search,
          width: 46.w,
          height: 46.h,
        ),
      ),
      horizontalSpace(6.w),
      IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        icon: SvgPicture.asset(
          IconLinks.filter,
          width: 46.w,
          height: 46.h,
        ),
      ),
    ],
  );
}
