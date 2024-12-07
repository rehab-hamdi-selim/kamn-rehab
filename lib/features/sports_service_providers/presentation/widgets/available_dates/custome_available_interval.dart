import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/available_dates/available_dates_cubit.dart';

class CustomeAvailableInterval extends StatelessWidget {
  const CustomeAvailableInterval(
      {super.key, required this.interval, required this.day});

  final DateTime interval;
  final String day;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AvailableDatesCubit>();

    bool isSelected(DateTime interval) {
      if (cubit.selectedIntervals.containsKey(day)) {
        return cubit.selectedIntervals[day]!.contains(interval);
      }
      return false;
    }

    return GestureDetector(
      onTap: () {
        cubit.onIntervalSelection(interval, day);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        width: 100.w,
        decoration: BoxDecoration(
          color: isSelected(interval) ? Colors.blueAccent : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected(interval) ? Colors.blue : Colors.grey,
            width: 2,
          ),
          boxShadow: isSelected(interval)
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
              color: isSelected(interval) ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
