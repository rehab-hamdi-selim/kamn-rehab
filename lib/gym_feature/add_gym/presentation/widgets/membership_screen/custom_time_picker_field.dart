import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class TimePickerField extends StatefulWidget {
  final String hint;

  const TimePickerField({
    super.key,
    required this.hint,
  });

  @override
  State<TimePickerField> createState() => _TimePickerFieldState();
}

class _TimePickerFieldState extends State<TimePickerField> {
  String? _selectedTime;

  void _pickTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      final now = DateTime.now();
      final formattedTime = DateFormat.jm().format(
        DateTime(now.year, now.month, now.day, pickedTime.hour, pickedTime.minute),
      );

      setState(() {
        _selectedTime = formattedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickTime,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedTime ?? widget.hint,
              style: TextStyle(
                fontSize: 14.sp,
                color: _selectedTime == null ? Colors.grey : Colors.black,
              ),
            ),
            Icon(Icons.calendar_today, size: 20.sp, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
