import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/font_weight_helper.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider_ground_details/service_provider_ground_details_cubit.dart';

class CustomeBottomSheet extends StatelessWidget {
  const CustomeBottomSheet({required this.playgroundModel, super.key});

  final PlaygroundRequestModel playgroundModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppPallete.whiteColor,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Decline',
            style: TextStyles.font20BlackBold,
            textAlign: TextAlign.center,
          ),
          Text(
            'leave a comment ',
            style: TextStyles.font20BlackBold
                .copyWith(fontWeight: FontWeightHelper.medium),
          ),
          TextField(
            controller: context
                .read<ServiceProviderGroundDetailsCubit>()
                .commentController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppPallete.greenColor.withOpacity(.2),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppPallete.greenColor.withOpacity(.5),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20)),
            ),
            maxLines: 3,
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppPallete.greenColor,
                      foregroundColor: AppPallete.ofWhiteColor),
                  onPressed: () {
                    context
                        .read<ServiceProviderGroundDetailsCubit>()
                        .decline(playgroundModel, {
                      'comment': context
                          .read<ServiceProviderGroundDetailsCubit>()
                          .commentController
                          .text,
                      'accpetingState': 'decline'
                    });
                  },
                  child: const Text('submit')))
        ],
      ),
    );
  }
}
