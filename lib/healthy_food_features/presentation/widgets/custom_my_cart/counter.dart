import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Counter extends StatelessWidget {
  Counter(
      {super.key,
      required this.counter,
      required this.onDecrease,
      required this.onIncrease});
  int counter;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

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
              onPressed: onDecrease),
          // الرقم المعروض في المنتصف
          Text(
            counter.toString(), // عرض الرقم الحالي
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
            onPressed: onIncrease,
          ),
        ],
      ),
    );
  }
}
