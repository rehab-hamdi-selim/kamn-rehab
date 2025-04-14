import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_state.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/create_gym_feature/create_gym_feature_cubit.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';

class FeatureBox extends StatelessWidget {
  const FeatureBox({super.key, required this.feature,required this.onTapClose,  this.isSelected=false});
  final Feature feature;
  final void Function(Feature feature) onTapClose;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    // final cubit = context.read<CreateGymFeatureCubit>();
    return Container(
      decoration: BoxDecoration(
          color:isSelected!?AppPallete.lightGreenColor.withOpacity(.3): AppPallete.whiteColor,
          borderRadius: BorderRadius.circular(30.r)),
      padding: EdgeInsets.all(5.w),
      child: Row(
        spacing: 4.w,
        children: [
          Text(feature.name ?? '',
              style: TextStyles.fontCircularSpotify10BlackRegular),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            decoration: BoxDecoration(
                color: feature.pricingOption!
                    .getBackgroundColor(feature.pricingOption),
                borderRadius: BorderRadius.circular(30.r)),
            child: Text(
              '${feature.price}/${feature.pricingOption!.name}',
              style: TextStyles.fontCircularSpotify8WhiteMedium,
            ),
          ),
          GestureDetector(
            onDoubleTap: () =>isSelected!?null: onTapClose(feature),
            child: Icon(
             isSelected!?Icons.check_circle: Icons.close,
              color:isSelected!? AppPallete.greenColor: AppPallete.blackColor,
              size: 12.r,
            ),
          )
        ],
      ),
    );
  }
}
