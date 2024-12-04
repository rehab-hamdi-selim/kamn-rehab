import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_avaliable_button.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_favorite_button.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_ground_details.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_price_section.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_rate_section.dart';
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
        CustomGroundDetails(owner: owner, km: km),
        Padding(
          padding: const EdgeInsets.only(bottom: 3.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(1.2.h),
              Text(
                placeText,
                style: TextStyles.font16DartBlackColorCircularSpotifyTextW400,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 12.h,
                    color: AppPalette.grayColor,
                  ),
                  horizontalSpace(1),
                  Text(
                    location,
                    style: Style.font10GrayColorW400,
                  ),
                  horizontalSpace(8),
                  CustomAvaliableButton(
                    available: available,
                  ),
                  horizontalSpace(8),
                  CustomRateSection(rates: rates),
                  const Spacer(),
                  CustomPriceSection(price: price),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
