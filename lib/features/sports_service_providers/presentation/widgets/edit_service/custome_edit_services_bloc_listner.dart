import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/edit_service_provider/edit_service_provider_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/edit_service_provider/edit_service_provider_state.dart';

import '../../../../../core/utils/navigation.dart';
import '../../../data/model/playground_request_model.dart';
import '../../screens/success_service_provider_screen.dart';

class CustomeEditServicesBlocListner extends StatelessWidget {
  final Widget child;
  final PlaygroundRequestModel playground;
  const CustomeEditServicesBlocListner(
      {super.key, required this.child, required this.playground});

  @override
  Widget build(BuildContext context) {
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
      playground.address = context
          .read<EditServiceProviderCubit>()
          .addressController
          .text
          .trim();
      playground.size = int.parse(
          context.read<EditServiceProviderCubit>().sizeController.text.trim());
      playground.price = double.parse(
          context.read<EditServiceProviderCubit>().priceController.text.trim());
      playground.govenrate = context
          .read<EditServiceProviderCubit>()
          .governateController
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

    return BlocListener<EditServiceProviderCubit, EditServiceProviderState>(
      listener: (context, state) {
        if (state.isImageUploaded) {
          context.read<EditServiceProviderCubit>().updateService(
              playground.playgroundId!, prepareUpdatedData(context).toMap());
        }
        if (state.isSuccess) {
          if (context
              .read<EditServiceProviderCubit>()
              .groundRemovedImagesUrl
              .isNotEmpty) {
            context.read<EditServiceProviderCubit>().deleteImagesFromStorage(
                context
                    .read<EditServiceProviderCubit>()
                    .groundRemovedImagesUrl);
          }
          navigationTo(context, const SuccessServiceProviderScreen());
        } else if (state.isServiceFailed) {
          context.read<EditServiceProviderCubit>().deleteImagesFromStorage(
              context.read<EditServiceProviderCubit>().groundImagesUrl);
          showSnackBar(context, state.erorrMessage!);
        } else if (state.isFailure) {
          showSnackBar(context, state.erorrMessage!);
        }
      },
      child: child,
    );
  }
}
