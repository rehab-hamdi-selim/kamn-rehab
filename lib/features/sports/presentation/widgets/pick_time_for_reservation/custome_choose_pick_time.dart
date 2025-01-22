import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kamn/features/sports/data/models/reservation_model.dart';
import 'package:kamn/features/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_cubit.dart';
import 'package:kamn/features/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_state.dart';
import 'package:kamn/features/sports/presentation/widgets/pick_time_for_reservation/custome_pick_interval_for_reservation.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';

class CustomeChoosePickTime extends StatelessWidget {
  final AvailableTime? availableTime;
  final int peroid;
  const CustomeChoosePickTime({super.key, required this.availableTime, required this.peroid});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PickTimeForReservationCubit,
        PickTimeForReservationState>(
      builder: (context, state) {
        var cubit = context.read<PickTimeForReservationCubit>();
        List<ReservationModel> reservationList = state.reservationList ?? [];
        DateTime selectedDate = state.selectedDate ?? DateTime.now();
        return SingleChildScrollView(
          child: Column(
            children: [
              Text(
                  'Choose Available Time Slots for ${DateFormat.EEEE().format(selectedDate)}:',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  if (availableTime != null &&
                      availableTime!
                              .data![DateFormat.E().format(selectedDate)] !=
                          null &&
                      (state.isIntervalSelected ||
                          state.isReservationLoaded)) ...[
                    ...availableTime!
                        .data![DateFormat.E().format(selectedDate)]!
                        .map((interval) {
                      return CustomePickIntervalForReservation(
                          day: DateFormat.E().format(selectedDate),
                          interval: cubit.viewModel
                              .copyDate(first: interval, second: selectedDate),
                          isPicked: cubit.viewModel.isInside(
                              reservationList,
                              cubit.viewModel.copyDate(
                                  first: interval, second: selectedDate),
                              selectedDate),
                              peroid:peroid,
                              );
                    }),
                  ] else if (state.isLoading)
                    const Center(
                      child: CircularProgressIndicator(),
                    )
                  else
                    const Center(
                        child: Text('No intervals provides at this day ')),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
