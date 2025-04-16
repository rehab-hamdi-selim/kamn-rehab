import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_state.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';

import 'custom_badge.dart';

class CustomSelectionItem extends StatelessWidget {
  final Feature feature;
  final int quantity;
  final Function increaseQuantity;
  final Function decreaseQuantity;
  final Function removeFeature;

  const CustomSelectionItem({
    super.key,
    required this.feature,
    required this.quantity,
    required this.increaseQuantity,
    required this.decreaseQuantity,
    required this.removeFeature,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    " ${feature.name}",
                    style: TextStyle(fontSize: 10.sp),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                SizedBox(width: 5.w),
                CustomBadge(
                  label: "${feature.price}/${feature.pricingOption!.name}",
                  color: feature.pricingOption!.getBackgroundColor(feature.pricingOption),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: AppPallete.grayColor,
                width: .2.w,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: InkWell(
                    onTap: () => decreaseQuantity(feature),
                    child: Icon(Icons.remove, size: 16.sp),
                  ),
                ),
                SizedBox(
                  width: 30.w,
                  child: Center(
                    child: Text(
                      "$quantity",
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ),
                ),
                Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: InkWell(
                    onTap: () => increaseQuantity(feature),
                    child: Icon(Icons.add, size: 16.sp),
                  ),
                ),
                SizedBox(width: 4.w),
                Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: InkWell(
                    onTap: () => removeFeature(feature),
                    child: Icon(
                      Icons.close,
                      size: 16.sp,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
