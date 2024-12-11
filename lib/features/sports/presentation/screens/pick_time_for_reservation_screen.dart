import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';
import 'package:kamn/features/sports/data/models/reservation_model.dart';
import 'package:kamn/features/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_cubit.dart';
import 'package:kamn/features/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_state.dart';
import 'package:kamn/features/sports/presentation/widgets/pick_time_for_reservation/custome_choose_pick_time.dart';
import 'package:kamn/features/sports/presentation/widgets/pick_time_for_reservation/custome_pick_interval_for_reservation.dart';
import 'package:kamn/features/sports/presentation/widgets/pick_time_for_reservation/custome_pick_time_bloc_listener.dart';
import 'package:kamn/features/sports/presentation/widgets/pick_time_for_reservation/custome_submit_button.dart';

import 'package:kamn/features/sports_service_providers/presentation/widgets/service_provider_grounds/custom_app_bar_service_provider.dart';
import 'package:table_calendar/table_calendar.dart';

class PickTimeForReservationScreen extends StatelessWidget {
  final PlaygroundModel playground;
  const PickTimeForReservationScreen({super.key, required this.playground});
  @override
  Widget build(BuildContext context) {
    return CustomePickTimeBlocListener(
      child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          appBar: CustomAppBarServiceProvider.appBar(
            arrowFunction: () {},
            notificationIconFunction: () {},
            profileFunction: () {},
            badgesIconFunction: () {},
          ),
          body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: BlocBuilder<PickTimeForReservationCubit,
                    PickTimeForReservationState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        TableCalendar(
                          firstDay: DateTime.now(),
                          lastDay: DateTime.utc(2030, 3, 14),
                          focusedDay: state.selectedDate ?? DateTime.now(),
                          selectedDayPredicate: (day) =>
                              isSameDay(state.selectedDate, day),
                          onDaySelected: (selectedDay, focusedDay) {
                            context
                                .read<PickTimeForReservationCubit>()
                                .onDaySelected(selectedDay);
                          },
                        ),
                        CustomeChoosePickTime(
                            availableTime: playground.availableTime!),
                        CustomeSubmitButton(
                          playground: playground,
                          selectedDate: state.selectedDate ?? DateTime.now(),
                        ),
                      ],
                    );
                  },
                ),
              ))),
    );
  }
}

