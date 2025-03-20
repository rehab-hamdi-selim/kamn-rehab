
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/gym_features/cubit/gym_features_cubit.dart';

import '../../cubits/gym_features/cubit/gym_features_state.dart';

class CustomDropDownMenu extends StatelessWidget {
  final List<String> menuItems = [
    '🛁 Hot Tubs',
    '🙎 Personal Trainer',
    '🔥 Sauna',
    '🏊 Swimming Pool',
    '🌐 Free WIFI',
    '🧒 Childcare Services',
    '🍹 Juice Bar',
    '🏋️‍♀️ State-of-the-Art',
    '🧘 Yoga Classes',
    '🎉 Exclusive Events',
    '💃 Diverse Classes',
    '🔒Locker Rooms'
  ];
  final TextEditingController controller;

  CustomDropDownMenu({
    super.key,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GymFeaturesCubit,GymFeaturesState>(
      builder: (context, state) {
        return DropdownMenu<String>(
          onSelected: (value) {
            context.read<GymFeaturesCubit>().takeSelectedValue(value!);
          },
          controller: controller,
          menuHeight: 350.h,
          width: 320.w,
          dropdownMenuEntries: menuItems
              .map((String item) => DropdownMenuEntry(
                    value: state.selectedValue,
                    label: item,
                  ))
              .toList(),
          menuStyle: MenuStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            elevation: WidgetStateProperty.all(20.r),
            backgroundColor: WidgetStateProperty.all(Colors.white),
          ),
          
          inputDecorationTheme: InputDecorationTheme(
            fillColor: AppPallete.whiteColor,
            filled: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              constraints: BoxConstraints.tight(const Size.fromHeight(40)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11.r),borderSide:const BorderSide(
                  color: AppPallete.lgGreyColor,
                  width: 1.2
                )
              )),
        );
      },
    );
  }
}
