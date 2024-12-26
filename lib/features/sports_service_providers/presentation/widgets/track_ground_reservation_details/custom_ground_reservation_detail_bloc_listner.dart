import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/track_ground_reservation_details/track_ground_reservation_details_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/track_ground_reservation_details/track_ground_reservation_details_states.dart';

class CustomeGroundReservationDetailsBlocListner extends StatelessWidget {
  final Widget child;
  const CustomeGroundReservationDetailsBlocListner(
      {super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TrackGroundReservationsDetailsCubit,
        TrackGroundsReservationDetailsState>(
      listener: (context, state) {
        if (state.isSuccess) {
          showSnackBar(context, state.successMessage!);
        }
        if (state.isFailure) {
          showSnackBar(context, state.erorrMessage!);
        }
      },
      child: child,
    );
  }
}
