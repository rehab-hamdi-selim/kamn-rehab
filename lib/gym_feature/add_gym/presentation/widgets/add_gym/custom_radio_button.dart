import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/gym_features/cubit/gym_features_cubit.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/gym_features/cubit/gym_features_state.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/cubit/add_service_provider/add_service_provider_cubit.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton(
      {super.key,
      required this.backgroundColor,
      required this.activeColor,
      required this.text});

  final Color backgroundColor;
  final Color activeColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GymFeaturesCubit, GymFeaturesState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.h), color: backgroundColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                  width: 25.w,
                  height: 37.h,
                  child: Radio<String>(
                    activeColor: activeColor,
                    fillColor: WidgetStateProperty.resolveWith((state) {
                      return null;
                    }),
                    value: text,
                    groupValue: context.read<GymFeaturesCubit>().statusOption,
                    onChanged: (String? newValue) {
                      context
                          .read<GymFeaturesCubit>()
                          .onChangeStatusSelection(newValue!);
                    },
                  )),
              Text(text,
                  style: TextStyles.fontCircularSpotify12BlackMedium
                      .copyWith(color: activeColor)),
            ],
          ),
        );
      },
    );
  }
}
