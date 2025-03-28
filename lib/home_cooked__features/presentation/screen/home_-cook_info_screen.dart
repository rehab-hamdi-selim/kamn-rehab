import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/utils/custom_hpme_cook_button.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/add_home_cook/add_home_cook_cubit.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/add_home_cook/gym_info/custom_gym_links_section.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/add_home_cook/gym_info/custom_gym_logo_info_section.dart';

import '../../../core/helpers/spacer.dart';

class CustomGymInfoScreen extends StatelessWidget {
  const CustomGymInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 16.h,
        children: [
          const CustomGymLogoInfoSection(),
          // const CustomGymPhotosSection(),
          const CustomGymLinksSection(),
          Row(
            children: [
              CustomCookButton(onPressed: () {
                context.read<AddHomeCookCubit>().validateHomeCookInfo();
                if (context
                        .read<AddHomeCookCubit>()
                        .homeCookInfoKey
                        .currentState!
                        .validate() ==
                    true) {
                  context.read<AddHomeCookCubit>().goToNextPage();
                }
              }),
            ],
          ),
          verticalSpace(30),
        ],
      ),
    );
  }
}
