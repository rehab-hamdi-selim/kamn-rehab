import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/const/constants.dart';
import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/theme/app_pallete.dart';
import '../../../../../core/theme/style.dart';
import '../../../../../core/utils/custom_star_rating.dart';
import '../../../data/models/playground_model.dart';

class CustomPlayGroundTitleAndLocation extends StatelessWidget {
  final PlaygroundModel? playgroundModel;
  const CustomPlayGroundTitleAndLocation(
      {super.key, required this.playgroundModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        verticalSpace(15.h),
        ownerAndDirectionRow(),
        verticalSpace(5.h),
        playGroundNameAndRating(),
        Text(
          playgroundModel?.address ?? "",
          style: TextStyles.font12GreenSemiBold,
        ),
        verticalSpace(10.h),
        playGroundFeatures(),
        verticalSpace(10.h),
      ],
    );
  }

  Row playGroundFeatures() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          Constants.playGroundFeatures,
          style: TextStyles.font20BlackBold,
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: AppPallete.greenColor.withOpacity(.3),
                ),
              ),
              child: CircleAvatar(
                radius: 5.sp,
                backgroundColor: AppPallete.lightGreen,
              ),
            ),
            horizontalSpace(6.w),
            Text(
              Constants.available,
              style: TextStyles.font13BlackRegular,
            )
          ],
        )
      ],
    );
  }

  Row playGroundNameAndRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(playgroundModel?.name ?? "",
            style: TextStyles.font24BlackRegular.copyWith(height: .85),
            maxLines: 2,
            overflow: TextOverflow.ellipsis),
        const Spacer(
          flex: 1,
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
            decoration: BoxDecoration(
                color: AppPallete.shadeOfGray,
                borderRadius: BorderRadius.circular(23.r)),
            child: CustomStarRating(rating: playgroundModel?.rating ?? 0)),
      ],
    );
  }

  Row ownerAndDirectionRow() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(13.r)),
            color: AppPallete.shadeOfGray,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                  radius: 10.r, child: Image.asset('assets/images/user.png')),
              horizontalSpace(3.w),
              Text(
                'mahmoudsayed',
                style: TextStyles.font10BlackColorW400,
              )
            ],
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        SizedBox(
          height: 25.h,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: AppPallete.lightGreen.withOpacity(.07),
                side: BorderSide(
                    color: AppPallete.lightGreen.withOpacity(.3), width: 1)),
            onPressed: () {},
            label: Text(
              Constants.directions,
              style: TextStyles.font14GreenRegular,
            ),
            icon: SvgPicture.asset('assets/icons/direction.svg'),
          ),
        ),
      ],
    );
  }
}
