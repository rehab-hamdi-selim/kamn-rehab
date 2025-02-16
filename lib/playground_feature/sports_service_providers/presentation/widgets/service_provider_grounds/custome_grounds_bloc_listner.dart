import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/cubit/service_provider_grounds/service_provider_grounds_cubit.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/cubit/service_provider_grounds/service_provider_grounds_state.dart';

class CustomeGroundsBlocListner extends StatelessWidget {
  final Widget child;
  const CustomeGroundsBlocListner({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ServiceProviderGroundsCubit,
        ServiceProviderGroundsState>(
      listener: (context, state) {
        if (state.isFailure) {
          showSnackBar(context, state.erorrMessage!);
        }
      },
      child: child,
    );
  }
}
