import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/data/models/order_model.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_track_order/delivery_time_screen.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_track_order/order_Delivery.dart';

class CustomTabScreenBtnSheet extends StatefulWidget {
  CustomTabScreenBtnSheet({
    super.key,
  });

  @override
  State<CustomTabScreenBtnSheet> createState() =>
      _CustomTabScreenBtnSheetState();
}

class _CustomTabScreenBtnSheetState extends State<CustomTabScreenBtnSheet> {
  bool isFirstActive = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Container(
          width: 343.w,
          height: 50.h,
          decoration: BoxDecoration(
            color: AppPallete.ofWhiteColor5,
            borderRadius: BorderRadius.circular(20.sp),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isFirstActive = true;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: isFirstActive ? 234.w : 77.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: isFirstActive
                        ? AppPallete.blackColor
                        : AppPallete.ofWhiteColor5,
                    borderRadius: BorderRadius.circular(29.sp),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Delivery Time",
                    style: TextStyle(
                      color: isFirstActive
                          ? AppPallete.whiteColor
                          : AppPallete.blackColor,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isFirstActive = false;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: isFirstActive ? 77.w : 234.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: isFirstActive
                        ? AppPallete.ofWhiteColor5
                        : AppPallete.blackColor,
                    borderRadius: BorderRadius.circular(29.sp),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Orders",
                    style: TextStyle(
                      color: isFirstActive
                          ? AppPallete.blackColor
                          : AppPallete.whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 19.h),
        IndexedStack(
          index: isFirstActive ? 0 : 1,
          children: [
            DeliveryTimeScreen(),
            OrderDelivery(),
          ],
        ),
      ],
    );
  }
}
