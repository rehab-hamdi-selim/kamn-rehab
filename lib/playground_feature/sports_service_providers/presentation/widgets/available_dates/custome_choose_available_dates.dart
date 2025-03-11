import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/playground_feature/sports_service_providers/data/model/playground_request_model.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/cubit/available_dates/available_dates_cubit.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/cubit/available_dates/available_dates_state.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/screens/service_provider_available_dates.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/widgets/available_dates/custome_available_interval.dart';

class CustomeChooseAvailableDates extends StatelessWidget {
  final PlaygroundRequestModel playground;
  final String day;
  const CustomeChooseAvailableDates(
      {super.key, required this.playground, required this.day});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvailableDatesCubit, AvailableDatesState>(
      builder: (context, state) {
        var cubit = context.read<AvailableDatesCubit>();

        return SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text('Choose Available Time Slots for $day:',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            activeColor: Colors.blueAccent,
                            value: cubit.isSelectAll,
                            onChanged: (value) {
                              cubit.onSelectAll(value ?? false, day);
                            },
                          ),
                          const Text("Select All"),
                        ],
                      ),
                      TextButton(
                          onPressed: () {
                            showMyBottomSheet(context);
                          },
                          child: const Text('create intervals'))
                    ],
                  ),
                ],
              ),
              Wrap(runSpacing: 10, spacing: 10, children: [
                if (state.intervials != null &&
                    state.intervials!.isNotEmpty) ...[
                  ...state.intervials!.map(
                    (interval) => CustomeAvailableInterval(
                      day: day,
                      interval: interval,
                    ),
                  ),
                ] else
                  const Center(child: Text('No intervals calculated')),
              ]),
            ],
          ),
        );
      },
    );
  }
}
