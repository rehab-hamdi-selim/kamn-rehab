import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/add_home_cook/add_home_cook_cubit.dart';

class UploadPromptWidget extends StatelessWidget {
  const UploadPromptWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/icons/insert_image.svg', width: 25.w),
        verticalSpace(7),
        Text(
          "Please upload a clear photo in JPG or PNG\n format. File size must be 5MBs or less",
          style: TextStyles.fontCircularSpotify8StealGrayRegular,
          textAlign: TextAlign.center,
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: AppPallete.whiteColor,
            side: const BorderSide(
              color: AppPallete.lightGreyColor,
              width: 0.27,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.5),
            ),
            minimumSize: Size(157.w, 16.h),
          ),
          onPressed: () => context.read<AddHomeCookCubit>().pickLogoImage(),
          child: Text(
            "Choose file",
            style: TextStyles.fontCircularSpotify8AccentBlackRegular,
          ),
        ),
      ],
    );
  }
}
