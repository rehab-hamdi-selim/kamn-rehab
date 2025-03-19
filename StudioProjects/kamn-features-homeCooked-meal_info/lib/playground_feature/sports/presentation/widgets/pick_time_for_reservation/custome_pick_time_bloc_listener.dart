import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/playground_feature/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_cubit.dart';
import 'package:kamn/playground_feature/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_state.dart';

class CustomePickTimeBlocListener extends StatelessWidget {
  final Widget child;
  const CustomePickTimeBlocListener({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<PickTimeForReservationCubit,
        PickTimeForReservationState>(
      listener: (context, state) {
        if (state.isSuccess) {
          Navigator.pushNamed(context, Routes.groundsScreen);
        }
        if (state.isFailure) {
          showSnackBar(context, state.erorrMessage!);
        }
      },
      child: child,
    );
  }
}
