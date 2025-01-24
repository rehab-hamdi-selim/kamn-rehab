import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider_ground_details/service_provider_ground_details_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider_ground_details/service_provider_ground_details_state.dart';

class CustomeGroundDetailsBlocListner extends StatelessWidget {
  final Widget child;
  const CustomeGroundDetailsBlocListner({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ServiceProviderGroundDetailsCubit,
        ServiceProviderGroundDetailsState>(
      listener: (context, state) {
        if (state.isSuccess) {
          showSnackBar(context, state.successMessage!);
          Navigator.of(context).pushNamedAndRemoveUntil(Routes.myProfileScreen,(route) => false);
        }
        if (state.isFailure) {
          showSnackBar(context, state.erorrMessage!);
        }
      },
      child: child,
    );
  }
}
