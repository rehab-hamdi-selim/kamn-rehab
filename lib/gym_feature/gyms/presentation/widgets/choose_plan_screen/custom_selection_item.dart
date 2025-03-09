import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_badge.dart';
import 'failure_model.dart';

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
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
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
                      "${feature.icon} ${feature.name}",
                      style: TextStyle(fontSize: 10.sp),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  CustomBadge(
                    label: "${feature.price}${feature.unit}",
                    color: feature.badgeColor,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () => decreaseQuantity(feature),
                  icon: Icon(Icons.remove, size: 14.sp),
                 
                ),
                Text("$quantity"),
                IconButton(
 style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey.shade100),
                  ),
                  onPressed: () => increaseQuantity(feature),
                  icon: Icon(
                    Icons.add,
                    size: 14.sp,
                  ),
                ),
                IconButton(
                  onPressed: () => removeFeature(feature),
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.red,
                    size: 14.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
