import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/create_gym_feature/create_gym_feature_cubit.dart';

class CustomGymFeatureBlocListener extends StatelessWidget {
  const CustomGymFeatureBlocListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateGymFeatureCubit, CreateGymFeatureState>(
      listener: (context, state) {
        if (state.isSuccess) {
          Navigator.pushNamed(context, Routes.membershipOfferScreen);
        }
      },
      child: child,
    );
  }
}
