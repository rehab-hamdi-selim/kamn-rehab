import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomReservationGroundInfo extends StatelessWidget {
  const CustomReservationGroundInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 37.w,
      right: 36.w,
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IntrinsicWidth(
              child: ListTile(
                leading: CircleAvatar(
                  maxRadius: 12,
                  child: Image.asset(ImageLinks.user_picture),
                ),
                horizontalTitleGap: 4,
                minVerticalPadding: 0,
                contentPadding: const EdgeInsets.all(0),
                title: Text(
                  'mahmoud sayed',
                  style: TextStyles.fontCircularSpotify8Regular
                      .copyWith(color: AppPallete.lightColor),
                ),
              ),
            ),
            IntrinsicWidth(
              child: ListTile(
                leading: const Icon(
                  Icons.location_on_outlined,
                  color: AppPallete.lightColor,
                ),
                horizontalTitleGap: 4,
                minVerticalPadding: 0,
                contentPadding: const EdgeInsets.symmetric(horizontal: 11),
                title: Text(
                  'Alexandria, Hadra',
                  style: TextStyles.fontCircularSpotify8Regular
                      .copyWith(color: AppPallete.lightColor),
                ),
              ),
            ),
            IntrinsicWidth(
              child: ListTile(
                leading: const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                minVerticalPadding: 0,
                contentPadding: const EdgeInsets.all(0),
                horizontalTitleGap: 4,
                title: Text(
                  '4.6 (123 reviews)',
                  style: TextStyles.fontCircularSpotify8Regular
                      .copyWith(color: AppPallete.lightColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
