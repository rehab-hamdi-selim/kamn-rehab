import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/add_service_provider/add_service_provider_state.dart';

import '../../../../../core/utils/navigation.dart';
import '../../../data/model/playground_request_model.dart';
import '../../cubit/add_service_provider/add_service_provider_cubit.dart';
import '../../screens/success_service_provider_screen.dart';

class CustomeAddServicesBlocListner extends StatelessWidget {
  final Widget child;
  final String type;
  const CustomeAddServicesBlocListner(
      {super.key, required this.child, required this.type});

  @override
  Widget build(BuildContext context) {
    PlaygroundRequestModel prepareData(BuildContext context) =>
        PlaygroundRequestModel(
          name: context
              .read<AddServiceProviderCubit>()
              .nameController
              .text
              .trim(),
          phone: context
              .read<AddServiceProviderCubit>()
              .phoneController
              .text
              .trim(),
          address: context
              .read<AddServiceProviderCubit>()
              .addressController
              .text
              .trim(),
          size: int.parse(context
              .read<AddServiceProviderCubit>()
              .sizeController
              .text
              .trim()),
          govenrate:
              context.read<AddServiceProviderCubit>().governateController.text,
          images: context.read<AddServiceProviderCubit>().imagesUrl,
          latitude:
              context.read<AddServiceProviderCubit>().coordinates['latitude'],
          longitude:
              context.read<AddServiceProviderCubit>().coordinates['longitude'],
          ownerId: "under develop",
          price: 0000,
          description: "under develop",
          status: "under develop",
          type: type,
        );

    return BlocListener<AddServiceProviderCubit, AddServiceProviderState>(
      listener: (context, state) {
        if (state.isImageUploaded) {
          context
              .read<AddServiceProviderCubit>()
              .addService(prepareData(context));
        }
        if (state.isSuccess) {
          navigationTo(context, const SuccessServiceProviderScreen());
        } else if (state.isServiceFailed) {
          context.read<AddServiceProviderCubit>().deleteImagesFromStorage();
          showSnackBar(context, state.erorrMessage!);
        } else if (state.isFailure) {
          showSnackBar(context, state.erorrMessage!);
        }
      },
      child: child,
    );
  }
}
