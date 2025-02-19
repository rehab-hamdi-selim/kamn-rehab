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
          borderRadius: BorderRadius.circular(20), // Use ScreenUtil for radius
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text("${feature.icon} ${feature.name}",
                    style: TextStyle(
                      fontSize: 10.sp, // Use ScreenUtil for font size
                    )),
                SizedBox(width: 5.w), // Use ScreenUtil for width
                CustomBadge(
                  label: "${feature.price}${feature.unit}",
                  color: feature.badgeColor,
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () => decreaseQuantity(feature),
                  icon: Icon(Icons.remove, size: 14.sp),
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(Colors.grey.shade100),
                  ),
                ),
                Text("$quantity"),
                IconButton(
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
