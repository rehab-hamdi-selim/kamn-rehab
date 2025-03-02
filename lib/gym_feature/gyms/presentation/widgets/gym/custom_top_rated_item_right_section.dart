import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym/custom_gym_feature_item.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym/custom_rating_bar.dart';

class CustomTopRatedItemRightSection extends StatelessWidget {
  const CustomTopRatedItemRightSection(
      {super.key,
      required this.gymName,
      required this.gymDescription,
      required this.gymLocation,
      required this.gymrate});
  final String gymName;
  final String gymDescription;
  final String gymLocation;
  final String gymrate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              gymName,
              textAlign: TextAlign.start,
              style: TextStyles.fontCircularSpotify20AccentBlackMedium,
            ),
            const Spacer(),
            CustomRatingBar(rate: gymrate),
          ],
        ),
        verticalSpace(4.h),
        Text(
          gymDescription,
          style: TextStyles.fontCircularSpotify10LightRegular,
        ),
        ListTile(
          leading: const Icon(
            Icons.location_on_outlined,
            color: AppPallete.darkGreyColor,
            size: 15,
          ),
          horizontalTitleGap: 0,
          minLeadingWidth: 0,
          minVerticalPadding: 0,
          minTileHeight: 0,
          contentPadding: EdgeInsets.only(left: 5.w, top: 12.h),
          title: Text(
            gymLocation,
            style: TextStyles.fontCircularSpotify7GreyMedium,
          ),
        ),
        verticalSpace(10.h),
        SizedBox(
          height: 20,
          child: ListView.separated(
            itemBuilder: (context, index) => const CustomGymFeatureItem(),
            separatorBuilder: (context, index) => horizontalSpace(2.67.w),
            itemCount: 10,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
