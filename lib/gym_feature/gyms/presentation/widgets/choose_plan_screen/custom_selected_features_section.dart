import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/gym_feature/gyms/data/models/features_model.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_plan_screen/custom_selection_item.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_plan_screen/failure_model.dart';

class CustomSelectedFeaturesSection extends StatelessWidget {
  final Map<FeatureModel, int> selectedFeatures;
  final Function increaseQuantity;
  final Function decreaseQuantity;
  final int totalPrice;
  final Function removeFeature;

  const CustomSelectedFeaturesSection({
    super.key,
    required this.selectedFeatures,
    required this.increaseQuantity,
    required this.decreaseQuantity,
    required this.totalPrice,
    required this.removeFeature,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Selection:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(
            height: 150.h, // Set a max height to avoid infinite growth
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (selectedFeatures.isEmpty)
                    const Text(
                      "No features selected",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ...selectedFeatures.entries.map((entry) {
                    final feature = entry.key;
                    final quantity = entry.value;
                    return CustomSelectionItem(
                      feature: feature,
                      quantity: quantity,
                      increaseQuantity: increaseQuantity,
                      decreaseQuantity: decreaseQuantity,
                      removeFeature: removeFeature,
                    );
                  }),
                ],
              ),
            ),
          ),
          const Divider(),
          Center(
            child: Text(
              "Total: $totalPrice£EGP",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
