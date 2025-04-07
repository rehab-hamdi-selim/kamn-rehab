import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/home_page/custom_icons.dart';

import '../../../../core/const/icon_links.dart';
import '../../../../core/theme/app_pallete.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 45.w,
          height: 45.h,
          decoration: const ShapeDecoration(
            color: AppPallete.lightGreyBackground,
            shape: OvalBorder(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: SvgPicture.asset(
              IconLinks.menu,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DELIVER TO',
              style: TextStyles.circularSpotify12BoldGreen,
            ),
            //////////////////
            Row(
              children: [
                Text(
                  'Alexandria, San Stefano',
                  style: TextStyles.fontCircularSpotify14LightBlackRegular,
                ),
                Transform.rotate(
                  angle: 3.14159,
                  child: Container(
                    width: 10.75.w,
                    height: 7.68.h,
                    decoration: const ShapeDecoration(
                      color: AppPallete.darkGreenColor,
                      shape: StarBorder.polygon(
                        sides: 3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const CustomIcons(
          image: IconLinks.bell,
          index: 0,
        ),
        const CustomIcons(
          image: IconLinks.cart,
          index: 6,
        ),
      ],
    );
  }
}
