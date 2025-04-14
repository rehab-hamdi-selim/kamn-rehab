import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/utils/custom_gym_button.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_cubit.dart';

class CustomNavigationButtons extends StatelessWidget {
  final VoidCallback onNextPressed;
  const CustomNavigationButtons({super.key, required this.onNextPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
    spacing: 12.w,
    children: [
      Expanded(
        child: CustomGymButton(
          text: 'Back',
          onPressed: () {
            context.read<AddGymCubit>().goToPreviousPage();
          },
          isBackButton: true,
          foregroundColor: AppPallete.blackColor,
          backgroundColor: AppPallete.ofWhiteColor,
        ),
      ),
      Expanded(
        child: CustomGymButton(
          text: 'Submit',
          onPressed: onNextPressed,
        ),
      ),
    ],
  );
  }
}