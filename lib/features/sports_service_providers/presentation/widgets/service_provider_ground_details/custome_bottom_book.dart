import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider_ground_details/service_provider_ground_details_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/service_provider_ground_details/custome_bottom_sheet.dart';

class CustomeBottomBook extends StatelessWidget {
  const CustomeBottomBook({required this.playgroundRequestModel, super.key});

  final PlaygroundRequestModel playgroundRequestModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66.7.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      margin: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(65),
        color: AppPallete.greenColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // RichText(
          //   text: TextSpan(
          //       text: playgroundModel?.price
          //           .toString(), 
          //       style: TextStyles.font32OfWhiteMedium,
          //       children: [
          //         TextSpan(
          //             text: ' / hr', style: TextStyles.font20OfWhiteReuglar)
          //       ]),
          // ),
          ElevatedButton(
              onPressed: () {
                showBottomSheet(
                    constraints: BoxConstraints(maxHeight: 300.h),
                    context: context,
                    builder: (context) => CustomeBottomSheet(
                          playgroundModel: playgroundRequestModel,
                        ));
              },
              child: Text(
                'Decline',
                style: TextStyles.font16greenSemiBold.copyWith(
                  color: AppPallete.redColor,
                ),
              )),
          ElevatedButton(
              onPressed: () {
                context.read<ServiceProviderGroundDetailsCubit>().accept(
                    playgroundRequestModel,);
              },
              child: Text(
                'Accept',
                style: TextStyles.font16greenSemiBold,
              ))
        ],
      ),
    );
  }
}
