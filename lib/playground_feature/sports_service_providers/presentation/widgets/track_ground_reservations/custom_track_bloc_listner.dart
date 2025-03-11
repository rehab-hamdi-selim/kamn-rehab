import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/cubit/track_ground_reservations/track_ground_reservations_cubit.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/cubit/track_ground_reservations/track_ground_reservations_states.dart';

class CustomeTrackBlocListner extends StatelessWidget {
  final Widget child;
  const CustomeTrackBlocListner({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TrackGroundReservationsCubit, TrackGroundsState>(
      listener: (context, state) {
        if (state.isFailure) {
          showSnackBar(context, state.erorrMessage!);
        }
      },
      child: child,
    );
  }
}
