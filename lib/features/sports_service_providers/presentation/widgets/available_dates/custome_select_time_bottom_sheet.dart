import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/utils/time_picker.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/available_dates/available_dates_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/available_dates/available_dates_state.dart';

class CustomeSelectTimeBottomSheet extends StatelessWidget {
  const CustomeSelectTimeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AvailableDatesCubit>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<AvailableDatesCubit, AvailableDatesState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Select Start and End Times'),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Start Time:  ${state.startAt?.format(context) ?? 'Not set'}'),
                  IconButton(
                      icon: const Icon(Icons.access_time),
                      onPressed: () async {
                        var startTime = await selectTime(context);
                        cubit.setStartTime(startTime);
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'End Time:  ${state.endAt?.format(context) ?? 'Not set'}'),
                  IconButton(
                      icon: const Icon(Icons.access_time),
                      onPressed: () async {
                        var endTime = await selectTime(context);
                        cubit.setEndTime(endTime);
                      }),
                ],
              ),
              const SizedBox(height: 8),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(labelText: 'Period (in minutes)'),
                onChanged: (value) {
                  state.period = int.tryParse(value) ?? 60;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  cubit.calculateIntervails();
                  Navigator.pop(context);
                },
                child: const Text('Calculate Intervals'),
              ),
            ],
          );
        },
      ),
    );
  }
}
