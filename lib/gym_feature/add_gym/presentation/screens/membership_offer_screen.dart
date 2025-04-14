import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_gym_app_bar.dart';
import 'package:kamn/core/utils/custom_gym_button.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/membership_offer/membership_offer_cubit.dart';
import 'package:kamn/gym_feature/add_gym/presentation/screens/select_plan_features_screen.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/membership_screen/custom_notes_section.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/membership_screen/custom_time_dropdown.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/membership_screen/offer_name_container.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/membership_screen/choose_at_least_one_plan.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/membership_screen/open_container.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/membership_screen/price_container.dart';

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
                SizedBox(height: 19.h),
                const CustomNotesSection(),
                SizedBox(height: 19.h),

                CustomGymButton(onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                                value: context.read<MembershipOfferCubit>()
                                  ..getFeatures(context.read<MembershipOfferCubit>().state.gymId!),
                                child: const SelectPlanFeaturesScreen(),
                              )));
                }) // Add this line to include the CustomNotesSection widgeGy
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
