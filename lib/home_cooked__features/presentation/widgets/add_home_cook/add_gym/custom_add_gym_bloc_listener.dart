import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/home_cooked__features/data/models/gym_model_test.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/add_home_cook/add_gym_cubit.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/add_home_cook/add_gym_state.dart';

class CustomAddGymBlocListener extends StatelessWidget {
  const CustomAddGymBlocListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddHomeCookCubit>();
    return BlocListener<AddHomeCookCubit, AddGymState>(
      listener: (context, state) {
        if (state.isUploadImagesSuccess) {
          cubit.addGymRequest(prepareGymData(context));
        }
        if (state.isAddGymSuccess) {
          print("success adding gym");
        }
      },
      child: child,
    );
  }

  HomeCookModel prepareGymData(BuildContext context) {
    final user = context.read<AppUserCubit>().state.user;
    final cubit = context.read<AddHomeCookCubit>();
    final gymRequest = HomeCookModel(
      name: cubit.nameController.text,
      address: cubit.emailController.text,
      contactNumber: cubit.phoneController.text,
      description: cubit.descriptionController.text,
      scoialMediaLinks: [
        ScoialMediaLink(
            name: 'facebook', link: cubit.facebookController.text.trim()),
        ScoialMediaLink(
            name: 'instagram', link: cubit.instagramController.text.trim()),
        ScoialMediaLink(name: 'x', link: cubit.xController.text.trim()),
      ],
      logoUrl: cubit.state.imagesUrlMap?['logo']?.firstOrNull,
      imagesUrl: cubit.state.imagesUrlMap?['gymImages'],
      operationLicenseImageUrl: cubit.state.imagesUrlMap!['mandatory']![0],
      ownerIdPassportImageUrl: cubit.state.imagesUrlMap!['mandatory']![1],
      ownershipContractImageUrl: cubit.state.imagesUrlMap!['mandatory']![2],
      taxRegistrationImageUrl:
          cubit.state.imagesUrlMap!['mandatory']!.length > 3
              ? cubit.state.imagesUrlMap!['mandatory']![3]
              : null,
      phoneNumber: cubit.contactController.text.trim(),
      serviceProviderId: user?.uid,
      currentStatus: CurrentStatus.pending,
    );

    return gymRequest;
  }
}
