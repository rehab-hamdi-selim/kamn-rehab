import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class WeekdaySelector extends StatefulWidget {
  const WeekdaySelector({super.key});

  @override
  State<WeekdaySelector> createState() => _WeekdaySelectorState();
}

class _WeekdaySelectorState extends State<WeekdaySelector> {
  late List<String> days;
  late List<bool> selectedDays; // Track selected days

  @override
  void initState() {
    super.initState();
    days = getDayAbbreviations();
    selectedDays =
        List.generate(7, (index) => false); // Initialize all as unselected
  }

  List<String> getDayAbbreviations() {
    final baseDate = DateTime(2023, 10, 7);
    final days = List.generate(7, (index) {
      return DateFormat.E('en').format(baseDate.add(Duration(days: index)));
    });
    days[4] = 'Wend'; // Custom abbreviation
    return days;
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.symmetric(
        borderRadius: BorderRadius.circular(11.75.r),
        outside: const BorderSide(color: Color(0XFFD6D6DA)),
        inside: const BorderSide(color: Color(0XFFD6D6DA)),
      ),
      columnWidths: {0: FlexColumnWidth(1.w)},
      children: [
        TableRow(
          children: List.generate(days.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedDays[index] =
                      !selectedDays[index]; // Toggle selection
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        selectedDays[index] ? Colors.green : Colors.transparent,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    days[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.h,
                      color: selectedDays[index] ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
