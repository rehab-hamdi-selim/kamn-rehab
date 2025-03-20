import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/cubit/add_service_provider/add_service_provider_state.dart';

import '../../../data/model/playground_request_model.dart';
import '../../cubit/add_service_provider/add_service_provider_cubit.dart';

class CustomeAddServicesBlocListner extends StatelessWidget {
  final Widget child;
  final String type;
  const CustomeAddServicesBlocListner(
      {super.key, required this.child, required this.type});

  @override
  Widget build(BuildContext context) {
    PlaygroundRequestModel prepareData(BuildContext context) =>
        PlaygroundRequestModel(
            playgroundName: context
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
            govenrate: context
                .read<AddServiceProviderCubit>()
                .governateController
                .text,

            groundImages:
                context.read<AddServiceProviderCubit>().groundImagesUrl,
            latitude:
                context.read<AddServiceProviderCubit>().coordinates['latitude'],
            longitude: context
                .read<AddServiceProviderCubit>()
                .coordinates['longitude'],
            price: double.parse(context
                .read<AddServiceProviderCubit>()
                .priceController
                .text
                .trim()),
            description: context
                .read<AddServiceProviderCubit>()
                .descriptionController
                .text,
            status: context.read<AddServiceProviderCubit>().statusOption,
            ownershipImages:
                context.read<AddServiceProviderCubit>().ownershipImagesUrl,
            type: type,
            accpetingState: "pending",
            owner: context.read<AppUserCubit>().state.user);
    return BlocListener<AddServiceProviderCubit, AddServiceProviderState>(
      listener: (context, state) {
        if (state.isImageUploaded) {
          context
              .read<AddServiceProviderCubit>()
              .addService(prepareData(context));
        }
        if (state.isSuccess) {
          Navigator.pushNamed(context, Routes.serviceProviderAvailableDates,
              arguments: state.playground?.playgroundId);
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
