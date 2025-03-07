import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/gym_features/cubit/gym_features_cubit.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final TextInputType keyType;
  final String? sufixText;
  final Widget? widget;
  final int? lines;
  final String label;
  final String? optionalText;
  final int? maxLength;
  final BoxConstraints boxhight;
  const CustomTextFormField(
      {super.key,
      this.hintText,
      required this.keyType,
      required this.lines,
      required this.controller,
      required this.boxhight,
      this.maxLength,
      required int maxLine,
      required this.label,
      this.optionalText,
      this.sufixText,
      this.widget});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: label,
                style: TextStyles.fontCircularSpotify14LightBlackRegular,
              ),
              TextSpan(
                text: optionalText!,
                style: TextStyles.fontCircularSpotify12GrayRegular,
              ),
            ],
          ),
        ),
        verticalSpace(5),
        TextFormField(
          onChanged: (value) {
            context.read<GymFeaturesCubit>().takeTypedText(value);
          },
          maxLines: lines,
          maxLength: maxLength,
          buildCounter: maxLength != null
              ? (context,
                  {required currentLength,
                  required isFocused,
                  required maxLength}) {
                  return Container(
                      transform: Matrix4.translationValues(0, -130, 0),
                      child: Text(
                        '$currentLength/($maxLength) character',
                        style: TextStyle(
                            fontSize: 10,
                            color: currentLength == maxLength
                                ? AppPallete.redColor
                                : AppPallete.darkGreyColor),
                      ));
                }
              : null,
          keyboardType: keyType,
          controller: controller,
          style: TextStyles.fontCircularSpotify14LightBlackRegular,
          decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget,
              ),
              constraints: boxhight,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 237, 243, 238),
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppPallete.redColor,
                    width: 1.2,
                  ),
                  borderRadius: BorderRadius.circular(8.r)),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppPallete.lgWhiteColor,
                    width: 1.2,
                  ),
                  borderRadius: BorderRadius.circular(8.r)),
              hintText: hintText!,
              hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 12.h),
              fillColor: AppPallete.whiteColor,
              filled: true),
        ),
      ],
    );
  }
}
