import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/membership_offer/membership_offer_cubit.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/membership_offer/membership_offer_state.dart';

class CustomSelectedFeaturesBlocListener extends StatelessWidget {
  const CustomSelectedFeaturesBlocListener({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return  BlocListener<MembershipOfferCubit, MembershipOfferState>(
      listener: (context, state) {
        if (state.isSuccessAddPlan) {
          
        }
      },
      child: child,
    );
  }
}