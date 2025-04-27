import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/utils/custom_hpme_cook_button.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/add_home_cook/add_home_cook_cubit.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/add_home_cook/home_cook_info/custom_home_cook_links_section.dart';

import '../../../core/helpers/spacer.dart';
import '../widgets/add_home_cook/home_cook_info/custom_home_cook_logo_info_section.dart';

class HomeCookInfoScreen extends StatelessWidget {
  const HomeCookInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 16.h,
        children: [
          const CustomHomeCookLogoInfoSection(),
          // const CustomGymPhotosSection(),
          const CustomHomeCookLinksSection(),
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
