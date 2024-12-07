import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';
import 'package:kamn/features/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_cubit.dart';
import 'package:kamn/features/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_state.dart';

class CustomePickTimeBlocListener extends StatelessWidget {
  final Widget child;
  final PlaygroundModel playground;
  const CustomePickTimeBlocListener(
      {super.key, required this.child, required this.playground});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PickTimeForReservationCubit>();
    return BlocListener<PickTimeForReservationCubit,
        PickTimeForReservationState>(
      listener: (context, state) {
        if (state.isSuccess) {
          cubit.updateAvailableTimeForGround(
              playground.playgroundId!, cubit.updates);
        }
        if (state.isFailureUpdate) {
          cubit.deleteReservation(state.reservation!);
        }
        if (state.isAvailabledTimeUpdated) {
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
