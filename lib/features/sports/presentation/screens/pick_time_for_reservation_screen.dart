import 'package:flutter/material.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';
import 'package:kamn/features/sports/presentation/widgets/pick_time_for_reservation/custome_pick_interval_for_reservation.dart';
import 'package:kamn/features/sports/presentation/widgets/pick_time_for_reservation/custome_pick_time_bloc_listener.dart';
import 'package:kamn/features/sports/presentation/widgets/pick_time_for_reservation/custome_submit_button.dart';

import 'package:kamn/features/sports_service_providers/presentation/widgets/service_provider_grounds/custom_app_bar_service_provider.dart';

class PickTimeForReservationScreen extends StatelessWidget {
  final PlaygroundModel playground;
  const PickTimeForReservationScreen({super.key, required this.playground});
  @override
  Widget build(BuildContext context) {
    return CustomePickTimeBlocListener(
      playground: playground,
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
                child: Column(
                  children: [
                    const Text('Select the time you want :',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Wrap(
                      runSpacing: 10,
                      spacing: 10,
                      children: [
                        if (playground.availableTime!.isNotEmpty) ...[
                          ...playground.availableTime!.entries.map((entry) {
                            return CustomePickIntervalForReservation(
                              interval: entry.key,
                              status: entry.value,
                            );
                          }),
                        ] else
                          const Center(child: Text('No intervals calculated')),
                      ],
                    ),
                    CustomeSubmitButton(
                      playground: playground,
                    ),
                  ],
                ),
              ))),
    );
  }
}
