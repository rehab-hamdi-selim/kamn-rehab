import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/home_cooked__features/data/models/home_cook_model_test.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/add_home_cook/add_home_cook_cubit.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/add_home_cook/add_home_cook_state.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/v4.dart';

import '../../../../../core/common/cubit/app_user/app_user_state.dart';
import '../../../../../core/common/entities/user_model.dart';
import '../../../../../core/const/services_status_enum.dart';
import '../../../../../core/const/user_status_enum.dart';

class CustomAddHomeCookBlocListener extends StatelessWidget {
  const CustomAddHomeCookBlocListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddHomeCookCubit>();
    return BlocListener<AddHomeCookCubit, AddHomeCookState>(
      listener: (context, state) {
        if (state.isUploadImagesSuccess) {
          final homeCookRequest = prepareHomeCookData(context);
          cubit.addHomeCook(homeCookRequest);
        }
        if (state.isAddHomeCookSuccess) {
          context
              .read<AppUserCubit>()
              .saveHomeCookId(prepareHomeCookData(context).id!);
        }
      },
      child: BlocListener<AppUserCubit, AppUserState>(
          listener: (context, state) {
            if (state.homeCookId != null) {}
          },
          child: child),
    );
  }

  HomeCookModel prepareHomeCookData(BuildContext context) {
    final user = context.read<AppUserCubit>().state.user;
    final cubit = context.read<AddHomeCookCubit>();
    final homeCookRequest = HomeCookModel(
      id: const Uuid().v4(),
      nationalIdFrontImageUrl: cubit.state.imagesUrlMap!['nationalId']![0],
      nationalIdBackImageUrl: cubit.state.imagesUrlMap!['nationalId']![1],
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
      electricityBill: cubit.state.imagesUrlMap!['utility']![0],
      gasBill: cubit.state.imagesUrlMap!['utility']![1],
      landlineBill: cubit.state.imagesUrlMap!['utility']![2],
      phoneNumber: cubit.contactController.text.trim(),
      user: user ??
          UserModel(
              uid: '',
              email: '',
              name: '',
              createdAt: DateTime.now(),
              type: UserStatusEnum.homeCookServiceProvider.name,
              signFrom: ""),
      currentStatus: ServicesStatusEnum.pending,
    );

    return homeCookRequest;
  }
}
