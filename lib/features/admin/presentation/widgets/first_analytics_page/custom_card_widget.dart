import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardWidget extends StatelessWidget {
  CustomCardWidget({
    this.backgroundcolor,
    this.title,
    this.prficon,
    this.sufficon,
    this.iconcolor,
    this.percntagecolor,
    this.height,
    this.width,
    this.bercentagestatus,
    this.number,
    this.percentage,
  });
  Color? backgroundcolor, iconcolor, percntagecolor;
  String? title, number, percentage;
  Icon? prficon, sufficon;
  double? height, width;
  Bool? bercentagestatus;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Container(
        height: height?.h,
        width: width?.w,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 2,
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 0)
        ]),
        child: Card(
            color: backgroundcolor,
            surfaceTintColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: iconcolor,
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Text(
                        title ?? '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10.h),
                      ),
                      Spacer(
                        flex: 25,
                      ),
                      Icon(Icons.more_vert)
                    ],
                  ),
                  Text(
                    number ?? '',
                    style:
                        TextStyle(fontSize: 25.h, fontWeight: FontWeight.w700),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_circle_down_outlined,
                        size: 11,
                        color: Colors.red,
                      ),
                      Text(
                        '$percentage',
                        style: TextStyle(color: percntagecolor, fontSize: 11.h),
                      ),
                      Text(
                        ' less than last month',
                        style: TextStyle(color: Colors.grey, fontSize: 11.h),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
