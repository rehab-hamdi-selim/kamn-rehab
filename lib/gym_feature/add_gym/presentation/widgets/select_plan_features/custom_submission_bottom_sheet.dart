import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_gym_button.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/membership_offer/membership_offer_cubit.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/membership_offer/membership_offer_state.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/select_plan_features/custom_success_add_plan_widget.dart';

class CustomSubmissionBottomSheet extends StatelessWidget {
  final String planName;
  final String price;
  final String discount;
  final List<String> features;
  final VoidCallback onEditPressed;
  final VoidCallback onSubmitPressed;

  const CustomSubmissionBottomSheet({
    super.key,
    required this.planName,
    required this.price,
    required this.discount,
    required this.features,
    required this.onEditPressed,
    required this.onSubmitPressed,
  });

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<MembershipOfferCubit, MembershipOfferState>(
      builder: (context, state) {
        if(state.isLoading){
          return const Center(child: CircularProgressIndicator(color:  AppPallete.blackColor,));
        }
        if(state.isSuccessAddPlan){
          return CustomSuccessAddPlanWidget(onGoToProfilePressed: (){
            Navigator.pop(context);
          },);
        }
        return Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Membership Offer Details',
                style: TextStyles.fontCircularSpotify16BlackMedium,
              ),
              Text(
                'Here\'s how your plan will appear to users once it\'s published. Double-check the details below to ensure everything is correct',
                style: TextStyles.fontCircularSpotify12GrayRegular,
              ),
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
  image: const DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.fill,),                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppPallete.greyColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            '1 Month',
                            style: TextStyles.fontCircularSpotify12GrayRegular,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          planName,
                          style: TextStyles.fontCircularSpotify16BlackMedium,
                        ),
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppPallete.darkBlueColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            '$discount% off',
                            style: TextStyle(
                              color: AppPallete.darkBlueColor,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Text(
                          '2000EGP',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: AppPallete.greyColor,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          '$price EGP',
                          style: TextStyles.fontCircularSpotify16BlackMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    ...features.map((feature) => Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: Row(
                            children: [
                              Icon(
                                Icons.check_circle_outline,
                                color: AppPallete.darkBlueColor,
                                size: 20.w,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                feature,
                                style: TextStyles
                                    .fontCircularSpotify14BlackRegular,
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'All plans come with free onboarding by a personal trainer!',
                style: TextStyles.fontCircularSpotify12GrayRegular,
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: CustomGymButton(
                      onPressed: onEditPressed,
                      text: 'Edit Plan',
                      backgroundColor: Colors.amber,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: CustomGymButton(
                      onPressed: onSubmitPressed,
                      text: 'Submit',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }
}
