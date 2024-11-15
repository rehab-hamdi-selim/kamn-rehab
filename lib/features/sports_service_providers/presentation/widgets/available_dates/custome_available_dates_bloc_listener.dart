import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/available_dates/available_dates_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/available_dates/available_dates_state.dart';

class CustomeAvailableDatesBlocListener extends StatelessWidget {
  final Widget child;
  const CustomeAvailableDatesBlocListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AvailableDatesCubit, AvailableDatesState>(
      listener: (context, state) {
        if (state.isSuccess) {
          Navigator.pushNamed(context, Routes.successServiceProviderScreen);
        }
        if (state.isFailure) {
          showSnackBar(context, state.erorrMessage!);
        }
      },
      child: child,
    );
  }
}
