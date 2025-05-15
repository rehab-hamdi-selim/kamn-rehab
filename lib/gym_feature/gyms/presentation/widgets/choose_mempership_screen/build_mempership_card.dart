import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';
import 'package:kamn/gym_feature/gyms/presentation/Cubit/gym_details/gymdetails_cubit.dart';
import 'package:kamn/gym_feature/gyms/presentation/Cubit/gym_details/gymdetails_state.dart';

class BuildMempershipCard extends StatelessWidget {
  const BuildMempershipCard({
    super.key, this.selectedPlan, required this.isSelected, 
  });
  final Plan? selectedPlan;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GymDetailsCubit, GymDetailsState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(bottom: 16.h),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.black :Colors.transparent,
              width: isSelected ? .5.w :0,
            ),
            image: const DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.fill,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: isSelected ? [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ] : null,
          ),
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 20.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected ? Colors.black : AppPallete.lgGreyColor,
                            width: 2.w,
                          ),
                        ),
                        child: isSelected ? Center(
                          child: Container(
                            width: 12.w,
                            height: 12.h,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ) : null,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        selectedPlan?.planDuration?.displayName ?? "",
                        style: TextStyles.fontCircularSpotify16BlackMedium,
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      selectedPlan?.discountPercentage ?? '',
                      style: TextStyles.fontCircularSpotify12WhiteExtr2aBold,
                    ),
              )],
                ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Text(selectedPlan?.price ?? "",
                      style: TextStyles.fontCircularSpotify10BlackMedium
                          .copyWith(
                        decoration: TextDecoration.lineThrough,
                      )),
                  horizontalSpace(10.w),
                  const Icon(
                    size: 12,
                    Icons.arrow_forward,
                    color: AppPallete.accentBlackColor2,
                  ),
                  horizontalSpace(12.w),
                  Text(
                      "${selectedPlan?.priceAfterDiscount} EGP" ,
                      style: TextStyles
                          .fontCircularSpotify20AccentBlackMedium),
                ],
              ),
              SizedBox(height: 16.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: selectedPlan?.features!
                    .map((feature) => Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: Text(feature.name ?? "",
                              style: TextStyles
                                  .fontCircularSpotify12BlackRegular),
                        ))
                    .toList()??[],
              ),
            ],
          ),
                    );
      },
    );
  }
}
