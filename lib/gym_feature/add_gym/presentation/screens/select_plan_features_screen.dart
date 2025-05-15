import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_container.dart';
import 'package:kamn/core/utils/custom_gym_app_bar.dart';
import 'package:kamn/core/utils/custom_gym_button.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/membership_offer/membership_offer_cubit.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/membership_offer/membership_offer_state.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/feature_container.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/gym_feature/feature_box.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/membership_screen/choose_at_least_one_plan.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/select_plan_features/custom_submission_bottom_sheet.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/select_plan_features/custom_success_add_plan_widget.dart';

class SelectPlanFeaturesScreen extends StatelessWidget {
  const SelectPlanFeaturesScreen({super.key});

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
          Text("Add Membership Plan",
              style: TextStyles.fontCircularSpotify20accentBlackColorMedium),
          Text("Add Membership Plans to Publish Your Gym",
              style: TextStyles.fontCircularSpotify10darkGreyColorRegular),
          SizedBox(height: 19.h),
          const ChooseAtLeastOnePlan(),
          SizedBox(height: 19.h),
          CustomContainer(
            children: [
              Text(
                "Features Added During Gym Submission",
                style: TextStyles.fontCircularSpotify14AccentBlackMedium,
              ),
              verticalSpace(2),
              Text(
                "Choose from the features you previously added during gym submission or add new ones tailored to this plan.",
                style: TextStyles.fontCircularSpotify10darkGreyColorRegular,
              ),
              BlocBuilder<MembershipOfferCubit, MembershipOfferState>(
                builder: (context, state) {
                  final features = state.features ?? [];
                  if (features.isEmpty) {
                    return const Center(
                        child: Text("No Features Added For This Gym "));
                  }
                  if (state.isLoading) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: AppPallete.darkBlack,
                    ));
                  }
                  return Wrap(
                    spacing: 5.w,
                    children: features
                        .map((element) => FittedBox(
                                child: GestureDetector(
                              onTap: () {
                                context
                                    .read<MembershipOfferCubit>()
                                    .addFeatureToPlan(element);
                              },
                              child: FeatureBox(
                                feature: element,
                                onTapClose: (feature) {},
                                isSelected: state.isFeatureSelected(element),
                              ),
                            )))
                        .toList(),
                  );
                },
              ),
            ],
          ),
        ]),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.0.w),
        child: CustomGymButton(onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (_) => BlocProvider.value(
              value: context.read<MembershipOfferCubit>(),
              child: CustomSubmissionBottomSheet(
                planName: 'Monthly Offer',
                price: '1200',
                discount: '60',
                features: const [
                  'Access to all gym facilities',
                  'Free group classes (up to 5 per month)',
                  'Complimentary locker access',
                  'Sauna access included',
                ],
                onEditPressed: () {
                  Navigator.pop(context);
                },
                onSubmitPressed: () {
                  context.read<MembershipOfferCubit>().addPlan(
                      context.read<MembershipOfferCubit>().state.gymId!);
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
