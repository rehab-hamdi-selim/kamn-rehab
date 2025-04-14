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

TimeOfDay parseTimeOfDay(String timeStr) {
  // Remove non-breaking spaces and trim whitespace
  try {
    timeStr = timeStr.replaceAll('\u00A0', ' ').trim();
    final format = DateFormat('h:mm a');
    final dateTime = format.parse(timeStr);
    return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
  } on Exception catch (e) {
    print("Error parsing time: $e");
    return TimeOfDay.now();
  }
}
String formatTimeOfDay(TimeOfDay tod) {
  final now = DateTime.now();
  final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
  final format = DateFormat('hh:mm'); // e.g., 02:30 AM
  return format.format(dt);
}

List<DateTime>? calculateIntervals(
    TimeOfDay startTime, TimeOfDay endTime, int period) {
  final start = DateTime(DateTime.now().year, DateTime.now().month,
      DateTime.now().day, startTime.hour, startTime.minute);
  final end = DateTime(DateTime.now().year, DateTime.now().month,
      DateTime.now().day, endTime.hour, endTime.minute);
  final interval = Duration(minutes: period);

  List<DateTime> intervals = [];
  for (DateTime time = start; time.isBefore(end); time = time.add(interval)) {
    intervals.add(time);
  }
  if (intervals.isNotEmpty) {
    return intervals;
  } else {
    return null;
  }
}
