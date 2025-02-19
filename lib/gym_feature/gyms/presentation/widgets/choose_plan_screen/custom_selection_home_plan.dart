import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_plan_screen/custom_feature_selection_list.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_plan_screen/custom_selected_features_section.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_plan_screen/failure_model.dart';

import 'custom_review_selection_bottomSheet.dart';

class CustomSelectionHomePlan extends StatefulWidget {
  const CustomSelectionHomePlan({super.key});

  @override
  State<CustomSelectionHomePlan> createState() =>
      _CustomSelectionHomePlanState();
}

class _CustomSelectionHomePlanState extends State<CustomSelectionHomePlan> {
  final List<Feature> features = [
    Feature(
        name: "Hot Tubs",
        price: 120,
        unit: "/month",
        icon: "🛁",
        badgeColor: Colors.blue),
    Feature(
        name: "Sauna",
        price: 50,
        unit: "/session",
        icon: "♨️",
        badgeColor: Colors.orange),
    Feature(
        name: "Swimming Pool",
        price: 20,
        unit: "/session",
        icon: "🏊",
        badgeColor: Colors.cyan),
    Feature(
        name: "Juice Bar",
        price: 40,
        unit: "/month",
        icon: "🍹",
        badgeColor: Colors.purple),
    Feature(
        name: "Childcare Services",
        price: 60,
        unit: "/session",
        icon: "👶",
        badgeColor: Colors.teal),
    Feature(
        name: "State-of-the-Art Equipment",
        price: 120,
        unit: "/month",
        icon: "💪",
        badgeColor: Colors.red),
    Feature(
        name: "Yoga Classes",
        price: 120,
        unit: "/month",
        icon: "🧘",
        badgeColor: Colors.green),
    Feature(
        name: "Exclusive Events",
        price: 120,
        unit: "/month",
        icon: "🎉",
        badgeColor: Colors.amber),
    Feature(
        name: "Diverse Classes",
        price: 50,
        unit: "/session",
        icon: "🏋️",
        badgeColor: Colors.green),
    Feature(
        name: "Locker Rooms",
        price: 20,
        unit: "/month",
        icon: "🔒",
        badgeColor: Colors.blueGrey),
    Feature(
        name: "Free WiFi",
        price: 0,
        unit: "Free",
        icon: "🌐",
        badgeColor: Colors.black),
  ];

  Map<Feature, int> selectedFeatures = {};

  void toggleFeature(Feature feature) {
    setState(() {
      if (selectedFeatures.containsKey(feature)) {
        selectedFeatures.remove(feature);
      } else {
        selectedFeatures[feature] = 1;
      }
    });
  }

  void increaseQuantity(Feature feature) {
    setState(() {
      if (selectedFeatures.containsKey(feature)) {
        selectedFeatures[feature] = selectedFeatures[feature]! + 1;
      }
    });
  }

  void decreaseQuantity(Feature feature) {
    setState(() {
      if (selectedFeatures.containsKey(feature) &&
          selectedFeatures[feature]! > 1) {
        selectedFeatures[feature] = selectedFeatures[feature]! - 1;
      } else {
        selectedFeatures.remove(feature);
      }
    });
  }

  void removeFeature(Feature feature) {
    setState(() {
      selectedFeatures.remove(feature);
    });
  }

  int get totalPrice {
    return selectedFeatures.entries
        .fold(0, (sum, entry) => sum + (entry.key.price * entry.value));
  }

  void _showReviewBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CustomReviewSelectionBottomSheet(
          selectedFeatures: selectedFeatures,
          totalPrice: totalPrice,
          onEditSelection: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Choose Features",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp, // Use ScreenUtil for font size
          ),
        ),
        Text(
          "Select a features that suits your fitness goals!",
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 10.sp, // Use ScreenUtil for font size
          ),
        ),
        Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 20.w, // Use ScreenUtil for radius
                backgroundImage: const NetworkImage("url"),
              ),
              Text(
                "Gold's Gym",
                style: TextStyle(
                  fontSize: 20.sp, // Use ScreenUtil for font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "@goldsgymalex",
                style: TextStyle(
                  fontSize: 10.sp, // Use ScreenUtil for font size
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300)),
          child: Column(
            children: [
              Text(
                "Select features for your membership, adjust sessions or months, and see the total price update instantly. You can modify features before finalizing your plan.",
                style: TextStyle(
                  fontSize: 10.sp, // Use ScreenUtil for font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h), // Use ScreenUtil for height
              CustomFeatureSelectionList(
                features: features,
                toggleFeature: toggleFeature,
                selectedFeatures: selectedFeatures,
              ),
              SizedBox(height: 20.h), // Use ScreenUtil for height
            ],
          ),
        ),
        SizedBox(height: 10.h),
        CustomSelectedFeaturesSection(
          selectedFeatures: selectedFeatures,
          increaseQuantity: increaseQuantity,
          decreaseQuantity: decreaseQuantity,
          totalPrice: totalPrice,
          removeFeature: removeFeature,
        ),
        SizedBox(height: 10.h), // Use ScreenUtil for height
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
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
                  "← Back",
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
                  _showReviewBottomSheet(context);
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
                  "Confirm",
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
    );
  }
}
