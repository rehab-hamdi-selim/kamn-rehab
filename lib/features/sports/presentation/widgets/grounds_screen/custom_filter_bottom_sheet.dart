import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/features/payment/presentation/widgets/payment_options/custom_button.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_cubit.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_bottom_sheet_top_section.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_data_filter_section.dart';

class CustomFilterBottomSheet extends StatelessWidget {
  const CustomFilterBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    final sportsGroundViewModel =
        context.read<SportsGroundsCubit>().sportsGroundViewModel;
    final sportsGroundCubit = context.read<SportsGroundsCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 6.h,
                width: 70.w,
                decoration: BoxDecoration(
                    color: AppPallete.lgGreyColor,
                    borderRadius: BorderRadius.circular(30.r)),
              ),
            ),
            verticalSpace(17.h),
            CustomBottomSheetTopSection(
                resetButton: () {
                  sportsGroundCubit.resetFilter();
                },
                closeSheet: () {
                  Navigator.pop(context);
                }),
            verticalSpace(20.h),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.w),
                child: const CustomDataFilterSection()),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                onTap: () {
                  sportsGroundCubit.filterPlayGroundData(
                    location: sportsGroundViewModel.loactionController!.text,
                    maxPrice: sportsGroundViewModel
                            .maxPriceController!.text.isNotEmpty
                        ? int.parse(
                            sportsGroundViewModel.maxPriceController!.text)
                        : null,
                    distance: sportsGroundViewModel.distance,
                    minPrice: sportsGroundViewModel
                            .minPriceController!.text.isNotEmpty
                        ? int.parse(
                            sportsGroundViewModel.minPriceController!.text)
                        : null,
                  );
                  Navigator.pop(context);
                },
                text: 'Apply Filter',
              ),
            )
          ],
        ),
      ),
    );
  }
}
