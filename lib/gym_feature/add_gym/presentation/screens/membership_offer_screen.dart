import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_gym_app_bar.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/offer_name_container.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/chooseatleastoneplan.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/open_container.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/price_container.dart';

class MembershipOfferScreen extends StatelessWidget {
  const MembershipOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.whiteColor,
      appBar: CustomGymAppBar.appBar(
        color: AppPallete.whiteColor,
        context: context,
        notificationIconFunction: () {},
        badgesIconFunction: () {},
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text("Add Membership Offer",
              style: TextStyles.fontCircularSpotify20accentBlackColorMedium),
          Text("Add Membership Plans to Publish Your Gym",
              style: TextStyles.fontCircularSpotify10darkGreyColorRegular),
          SizedBox(height: 19.h),
          const ChooseAtLeastOnePlan(),
          SizedBox(height: 19.h),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const OfferNameContainer(),
                SizedBox(height: 19.h),
                const PriceContainer(),
                SizedBox(height: 19.h),
                const OpenContainer(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
