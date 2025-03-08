import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/gyms/data/models/plan_model.dart';

class BuildMempershipCard extends StatelessWidget {
  const BuildMempershipCard({
    super.key,
    required this.plan,
  });

  final PlanModel plan;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppPallete.lgGreyColor, width: 2.w),
        image: const DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.fill,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(plan.subtitle,
                  style: TextStyles.fontCircularSpotify12BlackRegular),
              Text(plan.title,
                  style: TextStyles.fontCircularSpotify16BlackMedium),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(plan.discount,
                      style: TextStyles.fontCircularSpotify12WhiteExtr2aBold)),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(plan.pricelineThrough,
                  style: TextStyles.fontCircularSpotify10BlackMedium.copyWith(
                    decoration: TextDecoration.lineThrough,
                  )),
              horizontalSpace(10.w),
              const Icon(
                size: 12,
                Icons.arrow_forward,
                color: AppPallete.accentBlackColor2,
              ),
              horizontalSpace(12.w),
              Text(plan.price,
                  style: TextStyles.fontCircularSpotify20AccentBlackMedium),
            ],
          ),
          SizedBox(height: 16.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: plan.features
                .map((feature) => Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: Text(feature,
                          style: TextStyles.fontCircularSpotify12BlackRegular),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
