import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider/service_provider_state.dart';

import '../../../../../core/utils/navigation.dart';
import '../../../data/model/playground_model.dart';
import '../../cubit/service_provider/service_provider_cubit.dart';
import '../../screens/success_service_provider_screen.dart';

class CustomeAddServicesBlocListner extends StatelessWidget {
  final Widget child;
  const CustomeAddServicesBlocListner({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    void disposeController() {
      context.read<ServiceProviderCubit>().disposeControllers();
    }

    PlaygroundModel prepareData(BuildContext context) => PlaygroundModel(
          name: context.read<ServiceProviderCubit>().nameController.text.trim(),
          phone:
              context.read<ServiceProviderCubit>().phoneController.text.trim(),
          address: context
              .read<ServiceProviderCubit>()
              .addressController
              .text
              .trim(),
          size: int.parse(
              context.read<ServiceProviderCubit>().sizeController.text.trim()),
          govenrate:
              context.read<ServiceProviderCubit>().governateController.text,
          images: context.read<ServiceProviderCubit>().imagesUrl,
          latitude:
              context.read<ServiceProviderCubit>().coordinates['latitude'],
          longitude:
              context.read<ServiceProviderCubit>().coordinates['longitude'],
          ownerId: "under develop",
          price: 0000,
          description: "under develop",
          status: "under develop",
        );
    return BlocListener<ServiceProviderCubit, ServiceProviderState>(
      listener: (context, state) {
        if (state.isImageUploaded) {
          context.read<ServiceProviderCubit>().addService(prepareData(context));
        }
        if (state.isSuccess) {
          navigationTo(context, const SuccessServiceProviderScreen());
        } else if (state.isServiceFailed) {
          context.read<ServiceProviderCubit>().deleteImagesFromStorage();
          showSnackBar(context, state.erorrMessage!);
        } else if (state.isFailure) {
          showSnackBar(context, state.erorrMessage!);
        }
      },
      child: child,
    );
  }
}
