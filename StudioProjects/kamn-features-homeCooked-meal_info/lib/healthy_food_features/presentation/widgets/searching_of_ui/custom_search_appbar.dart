import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/const/icon_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/searching_of_ui/custom_search_dropodwn.dart';

Widget CustomSearchAppbar() {
  return Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      IconLinks.backArrow,
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                  horizontalSpace(6.3.w),
                  const CustomSearchDropodwn(),
                  horizontalSpace(30.w),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      IconLinks.search,
                      width: 46.w,
                      height: 46.h,
                    ),
                  ),
                  IconButton(
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