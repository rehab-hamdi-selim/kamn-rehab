import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 117.w,
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // زر ناقص
          IconButton(
            icon: Icon(
              Icons.remove,
              size: 18.sp,
              weight: 500,
              color: Color(0xff205B2A),
            ),
            onPressed: () {
              setState(() {
                counter--; // تقليل الرقم
              });
            },
          ),
          // الرقم المعروض في المنتصف
          Text(
            '$counter', // عرض الرقم الحالي
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff205B2A)),
          ),
          // زر زائد
          IconButton(
            icon: Icon(
              Icons.add,
              size: 18.sp,
              weight: 500,
              color: Color(0xff205B2A),
            ),
            onPressed: () {
              setState(() {
                counter++; // زيادة الرقم
              });
            },
          ),
        ],
      ),
    );
  }
}
