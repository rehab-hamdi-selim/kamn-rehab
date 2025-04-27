import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/helpers/validators.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/utils/custom_gym_text_form_field.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/add_home_cook/add_home_cook_cubit.dart';

class CustomHomeAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppPallete.ofWhiteColor,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppPallete.mediumLightGray, width: 0.2),
      ),
      child: Padding(
        padding: EdgeInsets.all(11.w),
        child: Form(
          key: context.read<AddHomeCookCubit>().addressCookVerifyKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // GPS Button
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Handle GPS functionality
                  },
                  icon: Icon(Icons.gps_fixed, size: 10.sp),
                  label: Text("GPS", style: TextStyle(fontSize: 8.sp)),
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 5.h),

              // Home Address Field
              CustomGymTextFormField(
                valodator: emptyValidator,
                controller:
                    context.read<AddHomeCookCubit>().homeAddressController,
                label: ' Home Address *',
                hint: 'enter your Address',
                helper: "Alexandria, San Stefano, Egypt.....",
              ),
              verticalSpace(12.h),

              // Street & Building Number Fields
              Row(
                children: [
                  Expanded(
                    child: CustomGymTextFormField(
                      valodator: emptyValidator,
                      controller:
                          context.read<AddHomeCookCubit>().streetController,
                      label: '  Street *',
                      hint: 'enter your Address',
                      helper: "San Stefano.....",
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: CustomGymTextFormField(
                      valodator: emptyValidator,
                      controller: context
                          .read<AddHomeCookCubit>()
                          .buildingNumberController,
                      label: '  Building Number *',
                      hint: 'enter building num',
                      helper: "12.....",
                    ),
                  ),
                ],
              ),

              verticalSpace(12.h),

              // Apartment Field
              CustomGymTextFormField(
                valodator: emptyValidator,
                controller: context.read<AddHomeCookCubit>().streetController,
                label: '    Apartment ',
                hint: 'enter your apartment num',
                helper: "12.....",
              ),

              verticalSpace(12.h),

              // Info Text
              Text(
                "Include your full address for verification — street, city, and postal code.",
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
