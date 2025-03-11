import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/playground_feature/sports_service_providers/data/model/playground_request_model.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/cubit/service_provider_ground_details/service_provider_ground_details_cubit.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/cubit/service_provider_ground_details/service_provider_ground_details_state.dart';

class CustomePlayGroundInfo extends StatelessWidget {
  const CustomePlayGroundInfo({required this.playgroundModel, super.key});

  final PlaygroundRequestModel? playgroundModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          verticalSpace(38.h),
          playGroundName(context),
          verticalSpace(21.h),
          playGroundFeatures(),
          verticalSpace(12.h),
          Flexible(
            child: SingleChildScrollView(
              child: BlocBuilder<ServiceProviderGroundDetailsCubit,
                  ServiceProviderGroundDetailsState>(
                builder: (context, state) {
                  return Stack(
                    children: [
                      Text(
                        "  ${playgroundModel?.description}",
                        style: TextStyles.font12blackRegular
                            .copyWith(fontSize: 16.h),
                        maxLines: context
                            .read<ServiceProviderGroundDetailsCubit>()
                            .maxLines,
                      ),
                      if (context
                          .read<ServiceProviderGroundDetailsCubit>()
                          .isVisible)
                        Positioned(
                          bottom:
                              0, // Ensure the container is aligned to the bottom
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 200.h,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(0, 255, 255, 255),
                                  Colors.white,
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (context
                          .read<ServiceProviderGroundDetailsCubit>()
                          .isVisible)
                        readMoreButton(context)
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Positioned readMoreButton(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          child: SizedBox(
            height: 30.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                  color: AppPallete.lightGreenColor,
                  width: 1,
                ),
                backgroundColor: const Color(0xffF6F6F6).withOpacity(0.65),
                elevation: 0,
              ),
              onPressed: () {
                context
                    .read<ServiceProviderGroundDetailsCubit>()
                    .onPressReadMore();
              },
              child: Text(
                "Read More",
                style: TextStyles.font16blackRegular,
              ),
            ),
          ),
        ),
      ),
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

  Row playGroundName(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(playgroundModel?.playgroundName ?? "",
              style: TextStyles.font24BlackRegular.copyWith(height: .85),
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
        ),
        ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, Routes.editServiceScreen,
                  arguments: playgroundModel);
            },
            icon: SvgPicture.asset('assets/icons/edit.svg'),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppPallete.lightBlackColor.withOpacity(.07),
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: AppPallete.lightBlackColor.withOpacity(.3),
                      width: 1),
                  borderRadius: BorderRadius.circular(30.w)),
            ),
            label: Text(
              'edit',
              style: TextStyles.font14RobotoLightBlackColorRegular,
            ))
      ],
    );
  }
}
