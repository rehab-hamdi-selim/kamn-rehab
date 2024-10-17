import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/commen/widgets/sized_box_style.dart';
import '../../../../core/theme_data/app_palette.dart';
import '../../../../core/theme_data/style.dart';
import '../../../../core/utils/app_images.dart';

class CustomGroundItem extends StatelessWidget {
  String imageUrl;
  String placeText;
  String location;
  String rates;
  String km;
  String available;
  String owner;
  String price;
  void Function()? favoriteOnTap;

  CustomGroundItem({
    super.key,
    required this.imageUrl,
    required this.favoriteOnTap,
    required this.placeText,
    required this.km,
    required this.owner,
    required this.location,
    required this.available,
    required this.rates,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
      decoration: BoxDecoration(
        color: AppPalette.backgroundColor,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppPalette.greenColor,
          width: 1.w,
        ),
      ),
      child: Column(children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 191.h,
                  placeholder: (context, url) => Image.asset(
                    AppImages.groupsImage,
                    fit: BoxFit.fill,
                  ),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error_outline, size: 40)),
            ),
            Positioned(
              top: 6,
              right: 6,
              child: InkWell(
                onTap: favoriteOnTap,
                child: Container(
                  padding: EdgeInsets.all(2.h.w),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppPalette.backgroundColor,
                  ),
                  child:  Center(
                    child: Icon(
                      Icons.favorite_outline,
                      color: AppPalette.darkGrayColor,
                      size: 20.sp,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Text(
              placeText,
              style: Style.font16DartBlackColorW400,
            ),
            SizedBoxStyle.horizontal(8.w),
            Text(
              "$km km",
              style: Style.font10DarkGreenColorW400,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Owner: ",
              style: Style.font10BlackColorW400,
            ),
            Text(
              owner,
              style: Style.font10DarkGreenColorW400,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 12.sp,
                  color: AppPalette.grayColor,
                ),
                SizedBoxStyle.horizontal(4.w),
                Text(
                  location,
                  style: Style.font10GrayColorW400,
                ),
                SizedBoxStyle.horizontal(8.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 2.h),
                  decoration: BoxDecoration(
                    color: AppPalette.backgroundColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppPalette.greenColor,
                      width: 1.w,
                    ),
                  ),
                  child: Container(
                    height: 4.h,
                    width: 4.w,
                    decoration: const BoxDecoration(
                        color: AppPalette.greenColor,
                        shape: BoxShape.circle
                    ),
                  ),
                ),
                SizedBoxStyle.horizontal(4.w),
                Text(
                 available ,
                  style: Style.font7DartBlackColorW400,
                ),
                SizedBoxStyle.horizontal(8.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: BoxDecoration(
                    color: AppPalette.backgroundColor,
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color: AppPalette.greenColor,
                      width: 1.w,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        rates,
                        style: Style.font10GrayColorW400,
                      ),
                      Icon(
                        Icons.star,
                        size: 12.sp,
                        color: AppPalette.yellowColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "$price LE",
                  style: Style.font16DartBlackColorW400,
                ),
                Text(
                  "/hr",
                  style: Style.font10BlackColorW400,
                ),
              ],
            ),
          ],
        ),

      ]),
    );
  }
}
