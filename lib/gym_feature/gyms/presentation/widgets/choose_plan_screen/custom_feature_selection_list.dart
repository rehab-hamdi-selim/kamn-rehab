import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/gym_feature/gyms/data/models/features_model.dart';
import 'package:kamn/gym_feature/gyms/presentation/Cubit/gym_details/gymdetails_cubit.dart';
import 'package:kamn/gym_feature/gyms/presentation/Cubit/gym_details/gymdetails_state.dart';

import 'custom_badge.dart';
import 'failure_model.dart';

class CustomFeatureSelectionList extends StatelessWidget {
  final Function toggleFeature;
  final Map<FeatureModel, int> selectedFeatures;

  const CustomFeatureSelectionList({
    super.key,
    required this.toggleFeature,
    required this.selectedFeatures,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GymDetailsCubit, GymDetailsState>(
      builder: (context, state) {
        return Wrap(
          spacing: 1.w, // Use ScreenUtil for spacing
          runSpacing: 1.w, // Use ScreenUtil for spacing
          children: state.gymFeatures!.map((feature) {
            bool isSelected = selectedFeatures.containsKey(feature);
            return GestureDetector(
              onTap: () => toggleFeature(feature),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
                // Use ScreenUtil for padding
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue.shade100 : Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius:
                      BorderRadius.circular(12.w), // Use ScreenUtil for radius
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
               
                    SizedBox(width: 3.w),
                    // Use ScreenUtil for width
                    Text(feature.name,
                        style: TextStyle(
                            fontSize: 10.sp, fontWeight: FontWeight.w400)),
                    // Use ScreenUtil for font size
                    SizedBox(width: 3.w),
                    // Use ScreenUtil for width
                    CustomBadge(
                      label: "${feature.price}/month",
                      color: AppPallete.blueColor,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
