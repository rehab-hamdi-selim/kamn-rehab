import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/gym_feature/gyms/data/models/features_model.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_plan_screen/custom_badge.dart';

import 'failure_model.dart';

class CustomReviewSelectionBottomSheet extends StatelessWidget {
  final Map<FeatureModel, int> selectedFeatures;
  final int totalPrice;
  final VoidCallback onEditSelection;

  const CustomReviewSelectionBottomSheet({
    super.key,
    required this.selectedFeatures,
    required this.totalPrice,
    required this.onEditSelection,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w), // Use ScreenUtil for padding
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.w)), // Use ScreenUtil for radius
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Review Your Selection",
              style: TextStyle(
                fontSize: 16.sp, // Use ScreenUtil for font size
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.h), // Use ScreenUtil for height
          Text(
            "Double-check your selections before proceeding to payment. You can go back to edit if needed.",
            style: TextStyle(
              fontSize: 10.sp, // Use ScreenUtil for font size
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h), // Use ScreenUtil for height
          ...selectedFeatures.entries.map((entry) {
            final feature = entry.key;
            final quantity = entry.value;
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              // Use ScreenUtil for padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        " ${feature.name}",
                        style: TextStyle(
                            fontSize: 10.sp, // Use ScreenUtil for font size
                            color: Colors.black),
                      ),
                      SizedBox(width: 5.w), // Use ScreenUtil for width
                      CustomBadge(
                        label: "${feature.price}/month",
                        color: AppPallete.blueColor,
                      ),
                      SizedBox(width: 10.w), // Use ScreenUtil for width
                      Text(
                        "total: ${feature.price * quantity}£EGP",
                        style: TextStyle(
                          fontSize: 10.sp, // Use ScreenUtil for font size
                          fontWeight: FontWeight.w700,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "$quantity",
                        style: TextStyle(
                          fontSize: 10.sp, // Use ScreenUtil for font size
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
          const Divider(),
          Center(
            child: Text(
              "Total: $totalPrice£EGP",
              style: TextStyle(
                fontSize: 10.sp, // Use ScreenUtil for font size
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.h), // Use ScreenUtil for height
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: onEditSelection,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    // Use ScreenUtil for padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.w),
                      // Use ScreenUtil for radius
                      side: const BorderSide(color: Colors.black),
                    ),
                  ),
                  child: Text(
                    "Edit Selection",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp, // Use ScreenUtil for font size
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w), // Use ScreenUtil for width
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Proceed to Payment
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    // Use ScreenUtil for padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          25.w), // Use ScreenUtil for radius
                    ),
                  ),
                  child: Text(
                    "Proceed to Payment",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp, // Use ScreenUtil for font size
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
