import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/di/di.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_view_model.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_filter_text_form_field.dart';

class CustomDataFilterSection extends StatelessWidget {
  const CustomDataFilterSection({super.key});
  @override
  Widget build(BuildContext context) {
    var groundViewModel = getIt<SportsGroundViewModel>();
    return Column(
      children: [
        CustomFilterTextFormField(
          controller: groundViewModel.loactionController,
          sufficIcon: Icons.location_on_outlined,
          hintText: 'Alexandria, Hadra',
          txt: 'Locations',
          textInputType: TextInputType.text,
        ),
        verticalSpace(25.h),
        CustomFilterTextFormField(
            controller: groundViewModel.dateController,
            sufficIcon: Icons.date_range,
            hintText: 'Monday, 16 Sep 2024 / 6 am - 7 am',
            txt: 'Dates & Time',
            textInputType: TextInputType.datetime),
        verticalSpace(25.h),
        Row(
          children: [
            Expanded(
              child: CustomFilterTextFormField(
                controller: groundViewModel.maxPriceController,
                textInputType: TextInputType.number,
                sufficIcon: null,
                hintText: 'max',
                txt: 'Price Range',
              ),
            ),
            horizontalSpace(7.w),
            Expanded(
              child: CustomFilterTextFormField(
                controller: groundViewModel.minPriceController,
                sufficIcon: null,
                textInputType: TextInputType.number,
                hintText: 'min',
                txt: '',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
