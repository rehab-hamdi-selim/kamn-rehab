import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/font_weight_helper.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_plan_screen/custom_selection_item.dart';

class CustomSelectedFeaturesSection extends StatelessWidget {
  final Map<Feature, int> selectedFeatures;
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
                color: AppPallete.whiteColor,
                border: Border.all(
                  color: Colors.black,
                  width: 0.5.w, // Use ScreenUtil for border width
                ),
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Total: ",
                      style: TextStyles.fontCircularSpotify12BlackRegular.copyWith(fontWeight: FontWeightHelper.light)
                    ),
                    TextSpan(
                      text: "$totalPrice£GP",
                      style:TextStyles.fontCircularSpotify12BlackMedium
                    ),
                  ],
                ),
              ),
            ),
          ),
          verticalSpace(10),
          Text(
            "Longer plans offer better discounts! Choose wisely.",
            style: TextStyles.fontCircularSpotify8GrayRegular,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
