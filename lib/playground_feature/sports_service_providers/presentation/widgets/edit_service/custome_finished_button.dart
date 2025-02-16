import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/playground_feature/sports_service_providers/data/model/playground_request_model.dart';

import 'package:kamn/playground_feature/sports_service_providers/presentation/cubit/edit_service_provider/edit_service_provider_cubit.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/cubit/edit_service_provider/edit_service_provider_state.dart';

class CustomeFinishedButton extends StatelessWidget {
  final PlaygroundRequestModel playground;
  const CustomeFinishedButton({super.key, required this.playground});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 76.w),
      child: BlocBuilder<EditServiceProviderCubit, EditServiceProviderState>(
        builder: (context, state) {
          return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: state.isLoading
                      ? const EdgeInsets.symmetric(vertical: 10)
                      : null,
                  disabledBackgroundColor: AppPallete.blackColor,
                  backgroundColor: AppPallete.blackColor),
              onPressed: state.isLoading
                  ? null
                  : () {
                      if (context
                              .read<EditServiceProviderCubit>()
                              .formKey
                              .currentState
                              ?.validate() ==
                          true) {
                        if (context
                            .read<EditServiceProviderCubit>()
                            .groundNewSelectedImageList
                            .isNotEmpty) {
                          context
                              .read<EditServiceProviderCubit>()
                              .addImagesToStorage();
                        } else {
                          context
                              .read<EditServiceProviderCubit>()
                              .updateService(playground,
                                  prepareUpdatedData(context).toMap());
                        }
                      }
                    },
              child: state.isLoading
                  ? const CircularProgressIndicator(
                      color: AppPallete.whiteColor,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.check_circle_outline,
                            color: AppPallete.lightGreen),
                        horizontalSpace(7.w),
                        Text(
                          Constants.finish,
                          style: TextStyles.fontInter16WhiteMedium,
                        )
                      ],
                    ));
        },
      ),
    );
  }

  PlaygroundRequestModel prepareUpdatedData(BuildContext context) {
    List<String> allImageUrl = [];
    for (var image
        in context.read<EditServiceProviderCubit>().state.groundImagesList!) {
      if (image is String) {
        allImageUrl.add(image);
      }
    }
    allImageUrl
        .addAll(context.read<EditServiceProviderCubit>().groundImagesUrl);
    playground.playgroundName =
        context.read<EditServiceProviderCubit>().nameController.text.trim();
    playground.phone =
        context.read<EditServiceProviderCubit>().phoneController.text.trim();
    playground.address =
        context.read<EditServiceProviderCubit>().addressController.text.trim();
    playground.size = int.parse(
        context.read<EditServiceProviderCubit>().sizeController.text.trim());
    playground.price = double.parse(
        context.read<EditServiceProviderCubit>().priceController.text.trim());
    playground.govenrate = context
        .read<EditServiceProviderCubit>()
        .governateController
        .text
        .trim();
    playground.description = context
        .read<EditServiceProviderCubit>()
        .descriptionController
        .text
        .trim();
    playground.status = context.read<EditServiceProviderCubit>().statusOption;
    playground.latitude =
        context.read<EditServiceProviderCubit>().coordinates['latitude'];
    playground.longitude =
        context.read<EditServiceProviderCubit>().coordinates['longitude'];
    playground.groundImages = allImageUrl;
    return playground;
  }
}
