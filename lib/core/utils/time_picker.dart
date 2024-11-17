import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<TimeOfDay?> selectTime(BuildContext context) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  if (picked != null) {
    return picked;
  } else {
    return null;
  }
}

List<String>? calculateIntervals(
    TimeOfDay startTime, TimeOfDay endTime, int period) {
  final start = DateTime(DateTime.now().year, DateTime.now().month,
      DateTime.now().day, startTime.hour, startTime.minute);
  final end = DateTime(DateTime.now().year, DateTime.now().month,
      DateTime.now().day, endTime.hour, endTime.minute);
  final interval = Duration(minutes: period);

  List<String> intervals = [];
  for (DateTime time = start; time.isBefore(end); time = time.add(interval)) {
    intervals.add(DateFormat.Hm().format(time));
  }
  if (intervals.isNotEmpty) {
    return intervals;
  } else {
    return null;
  }
}
