import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/add_home_cook/add_home_cook_cubit.dart';

import '../../../../../core/utils/custom_hpme_cook_button.dart';

class CustomHomeCookNavigationButtons extends StatelessWidget {
  final VoidCallback onNextPressed;

  const CustomHomeCookNavigationButtons(
      {super.key, required this.onNextPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12.w,
      children: [
        CustomCookButton(
          text: 'Back',
          onPressed: () {
            context.read<AddHomeCookCubit>().goToPreviousPage();
          },
          isBackButton: true,
          foregroundColor: AppPallete.blackColor,
          backgroundColor: AppPallete.ofWhiteColor,
        ),
        CustomCookButton(
          text: 'Submit',
          onPressed: onNextPressed,
        ),
      ],
    );
  }
}
