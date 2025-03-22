import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/add_home_cook/add_home_cook_cubit.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/add_home_cook/verify_location/custom_confirmation_dialog.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/add_home_cook/verify_location/custom_documents_section.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/add_home_cook/verify_location/custom_navigation_HomeButton.dart';

import '../../../core/helpers/spacer.dart';

class VerifyLocationScreenScreen extends StatelessWidget {
  const VerifyLocationScreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddHomeCookCubit>();
    return SingleChildScrollView(
      child: Column(
        spacing: 16.h,
        children: [
          const CustomDocumentsSection(),
          Divider(
            color: AppPallete.grayColor,
            thickness: 0.2.h,
            indent: 73.w,
            endIndent: 73.w,
          ),
          CustomHomeCookNavigationButtons(
            onNextPressed: () {
              cubit.checkMandatoryFields();

              //TODO: fix this key
              // //${cubit.requiredDocumentsKey.currentState!.validate()}
              print('''1 ${cubit.state.isGymInfoValid}
                  3${cubit.state.isValidAll}
                  ''');

              if (cubit.state.isGymInfoValid! &&
                  //  cubit.requiredDocumentsKey.currentState!.validate() &&
                  cubit.state.isValidAll) {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => BlocProvider.value(
                          value: cubit,
                          child: const CustomConfirmationDialog(),
                        ));
              }
            },
          ),
          verticalSpace(32),
        ],
      ),
    );
  }
}
