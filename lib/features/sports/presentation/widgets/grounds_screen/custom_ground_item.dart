import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_cubit.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_avaliable_button.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_ground_details.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_ground_image.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_price_section.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_rate_section.dart';
import '../../../../../core/theme_data/app_palette.dart';
import '../../../../../core/theme_data/style.dart';

class CustomGroundItem extends StatelessWidget {
  final PlaygroundModel playground;
  //final void Function() onTap;

  const CustomGroundItem({super.key, required this.playground});

  @override
  Widget build(BuildContext context) {
    var distance = (Geolocator.distanceBetween(
                playground.latitude ?? 0,
                playground.longitude ?? 0,
                context
                    .read<SportsGroundsCubit>()
                    .sportsGroundViewModel
                    .userLatitude,
                context
                    .read<SportsGroundsCubit>()
                    .sportsGroundViewModel
                    .userLongitude) /
            1000)
        .round();
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: AppPalette.backgroundColor,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: AppPalette.lightGreenColor,
            width: 1.w,
          ),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomGroundImage(
            images: playground.groundImages ?? [],
            favoriteOnTap: () {},
          ),
          verticalSpace(3),
          CustomGroundDetails(
            owner: playground.playgroundName ?? "",
            km: distance.toString(),
            groundSize: playground.size!.toInt(),
          ),
          verticalSpace(1.2.h),
          Text(
            playground.playgroundName ?? '',
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
                playground.address ?? '',
                style: Style.font10GrayColorW400,
              ),
              horizontalSpace(8),
              CustomAvaliableButton(
                available: playground.status ?? '',
              ),
              horizontalSpace(8),
              CustomRateSection(rates: playground.rating.toString()),
              const Spacer(),
              CustomPriceSection(price: playground.price.toString()),
            ],
          )
        ]),
      ),
    );
  }
}
