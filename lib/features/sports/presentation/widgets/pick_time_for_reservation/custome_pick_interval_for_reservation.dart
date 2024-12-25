import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kamn/features/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_cubit.dart';
import 'package:kamn/features/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_state.dart';

class CustomePickIntervalForReservation extends StatelessWidget {
  const CustomePickIntervalForReservation(
      {super.key,
      required this.interval,
      required this.isPicked,
      required this.day});

  final DateTime interval;
  final bool isPicked;
  final String day;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PickTimeForReservationCubit>();

    return BlocBuilder<PickTimeForReservationCubit,
        PickTimeForReservationState>(
      builder: (context, state) {
        return !isPicked
            ? GestureDetector(
                onTap: () {
                  cubit.onIntervalSelection(interval, day);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(16),
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: cubit.viewModel.isSelected(interval, day)
                        ? Colors.blueAccent
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: cubit.viewModel.isSelected(interval, day)
                          ? Colors.blue
                          : Colors.grey,
                      width: 2,
                    ),
                    boxShadow: cubit.viewModel.isSelected(interval, day)
                        ? [
                            BoxShadow(
                                color: Colors.blue.withOpacity(0.3),
                                blurRadius: 8,
                                spreadRadius: 2)
                          ]
                        : [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 4,
                                spreadRadius: 1)
                          ],
                  ),
                  child: Center(
                    child: Text(
                      DateFormat('HH:mm').format(interval),
                      style: TextStyle(
                        color: cubit.viewModel.isSelected(interval, day)
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            : Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(16),
                width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.redAccent,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 4,
                        spreadRadius: 1)
                  ],
                ),
                child: Center(
                  child: Text(
                    DateFormat('HH:mm').format(interval),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
      },
    );
  }
}
