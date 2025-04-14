// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/membership_offer/membership_offer_cubit.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/membership_offer/membership_offer_state.dart';

class CustomDatePickerField extends StatelessWidget {
  final String hint;
  final void Function(DateTime) onPressedOk;

  const CustomDatePickerField({
    super.key,
    required this.hint,
    required this.onPressedOk,
  });

  void _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppPallete.violetColor,
              onPrimary: Colors.white,
              onSurface: AppPallete.accentBlackColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppPallete.violetColor,
                textStyle: TextStyles.fontCircularSpotify14BlackMedium,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      onPressedOk(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MembershipOfferCubit, MembershipOfferState>(
      builder: (context, state) {
        String? formattedDate;
        if (hint == "From") {
          formattedDate = state.discountStartDate != null
              ? DateFormat('MMM dd, yyyy').format(state.discountStartDate!)
              : null;
        } else {
          formattedDate = state.discountEndDate != null
              ? DateFormat('MMM dd, yyyy').format(state.discountEndDate!)
              : null;
        }

        return GestureDetector(
          onTap: () => _pickDate(context),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppPallete.witeColorShade),
              borderRadius: BorderRadius.circular(11.75.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formattedDate ?? hint,
                  style: formattedDate == null
                      ? TextStyles.fontCircularSpotify12GrayRegular
                      : TextStyles.fontCircularSpotify12BlackRegular,
                ),
                Icon(Icons.calendar_month,
                    size: 20.sp, color: AppPallete.accentBlackColor),
              ],
            ),
          ),
        );
      },
    );
  }
}
