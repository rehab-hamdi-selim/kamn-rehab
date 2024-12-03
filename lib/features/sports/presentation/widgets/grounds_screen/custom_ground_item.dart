import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_favorite_button.dart';
import '../../../../../core/theme_data/app_palette.dart';
import '../../../../../core/theme_data/style.dart';
import '../../../../../core/utils/app_images.dart';

class CustomGroundItem extends StatelessWidget {
  final String imageUrl;
  final String placeText;
  final String location;
  final String rates;
  final String km;
  final String available;
  final String owner;
  final String price;
  final void Function()? favoriteOnTap;
  //final void Function() onTap;

  const CustomGroundItem({
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
    // required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: AppPalette.backgroundColor,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppPalette.lightGreenColor,
          width: 1.w,
        ),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Image.asset(
                width: 323.w,
                height: 122.h,
                AppImages.groupsImage,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 6,
              right: 6,
              child: CustomFavoriteButton(
                favoriteOnTap: favoriteOnTap,
              ),
            ),
          ],
        ),
        verticalSpace(3),
        Padding(
          padding: const EdgeInsets.only(bottom: 3.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    placeText,
                    style: Style.font16DartBlackColorW400,
                  ),
                  horizontalSpace(8),
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
                        size: 12.h,
                        color: AppPalette.grayColor,
                      ),
                      horizontalSpace(4),
                      Text(
                        location,
                        style: Style.font10GrayColorW400,
                      ),
                      horizontalSpace(8),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 2.h),
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
                              shape: BoxShape.circle),
                        ),
                      ),
                      horizontalSpace(4),
                      Text(
                        available,
                        style: Style.font7DartBlackColorW400,
                      ),
                      horizontalSpace(8),
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
                              size: 12.h,
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
            ],
          ),
        )
      ]),
    );
  }
}
