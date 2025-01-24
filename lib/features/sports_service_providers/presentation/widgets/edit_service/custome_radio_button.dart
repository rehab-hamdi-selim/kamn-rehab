import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

import 'package:kamn/features/sports_service_providers/presentation/cubit/edit_service_provider/edit_service_provider_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/edit_service_provider/edit_service_provider_state.dart';

class CustomeRadioButton extends StatelessWidget {
  const CustomeRadioButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        createRadioButton(
            context: context,
            text: Constants.available,
            color: AppPallete.greenColor,
            backgroundColor: AppPallete.lightGreenColor.withOpacity(.3)),
        createRadioButton(
            context: context,
            text: Constants.inUse,
            color: AppPallete.deepOrangeColor,
            backgroundColor: AppPallete.lightOrangeColor.withOpacity(.49)),
        createRadioButton(
            context: context,
            text: Constants.underRepairs,
            color: AppPallete.pureRedColor,
            backgroundColor: AppPallete.lightPinkColor),
      ],
    );
  }

  Widget createRadioButton(
      {required String text,
      required BuildContext context,
      required Color color,
      required Color backgroundColor}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(52.h), color: backgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 25.w,
            height: 37.h,
            child:
                BlocBuilder<EditServiceProviderCubit, EditServiceProviderState>(
              builder: (context, state) {
                return Radio<String>(
                  activeColor: color,
                  fillColor: WidgetStateProperty.resolveWith((state) {
                    return context
                                .read<EditServiceProviderCubit>()
                                .statusOption ==
                            text
                        ? color
                        : AppPallete.dartBlurGrayColor;
                  }),
                  value: text,
                  groupValue:
                      context.read<EditServiceProviderCubit>().statusOption,
                  onChanged: (String? newValue) {
                    context
                        .read<EditServiceProviderCubit>()
                        .onChangeStatusSelection(newValue!);
                  },
                );
              },
            ),
          ),
          Text(text,
              style: TextStyles.font12CircularSpotifyTextBlackMedium
                  .copyWith(color: color)),
        ],
      ),
    );
  }
}
