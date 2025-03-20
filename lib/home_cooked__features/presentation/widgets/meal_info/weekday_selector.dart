import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class WeekdaySelector extends StatelessWidget {
  List<String> getDayAbbreviations() {
    final baseDate = DateTime(2023, 10, 7);
    final days = List.generate(7, (index) {
      return DateFormat.E('en').format(baseDate.add(Duration(days: index)));
    });
    days[4] = 'Wend';
    return days;
  }

  const WeekdaySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final days = getDayAbbreviations();
    return Table(
      border: TableBorder.symmetric(
        borderRadius: BorderRadius.circular(11.75.r),
        outside: const BorderSide(
          color: Color(
            0XFFD6D6DA,
          ),
        ),
        inside: const BorderSide(
          color: Color(
            0XFFD6D6DA,
          ),
        ),
      ),
      columnWidths: {
        0: FlexColumnWidth(
          1.w,
        ),
      },
      children: [
        TableRow(
          children: days.map((day) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Text(
                day,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.h,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
