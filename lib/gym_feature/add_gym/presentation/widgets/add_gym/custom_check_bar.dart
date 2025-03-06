import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/gym_features/cubit/gym_features_cubit.dart';

import '../../../../../core/theme/font_weight_helper.dart';
import '../../cubits/gym_features/cubit/gym_features_state.dart';

class CustomCheckBar extends StatelessWidget {
  final bool _chosen = true;
  final String? txt;
  final Color cardColor;
  final Color textColor;
  final Color checkColor;

  CustomCheckBar(
      {super.key,
      required this.txt,
      required this.cardColor,
      required this.textColor,
      required this.checkColor});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CustomCheckbox(
              checkColor: cardColor,
            ),
            horizontalSpace(4),
            Text(
              txt!,
              style: TextStyle(
                  fontFamily: "Roboto",
                  color: textColor,
                  fontWeight: FontWeightHelper.regular,
                  fontSize: 12.h),
            )
          ],
        ),
      ),
    );
  }
}

class CustomCheckbox extends StatefulWidget {
  final Color checkColor;

  const CustomCheckbox({super.key, required this.checkColor});

  @override
  _CustomCheckboxExampleState createState() => _CustomCheckboxExampleState();
}

class _CustomCheckboxExampleState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GymFeaturesCubit, GymFeaturesState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            setState(() {
              isChecked = !isChecked;
            });
           context.read<GymFeaturesCubit>().takeisChecked(isChecked);
          },
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color:
                    isChecked ? AppPallete.shadeOfGray : AppPallete.shadeOfGray,
                width: 2,
              ),
            ),
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: isChecked ? 8.w : 0,
                height: isChecked ? 8.h : 0,
                decoration: const BoxDecoration(
                  color: AppPallete.accentBlackColor2,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
