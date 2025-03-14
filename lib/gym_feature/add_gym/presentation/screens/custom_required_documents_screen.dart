import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_cubit.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/required_documents/custom_mandatory_documents_section.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/required_documents/custom_navigation_buttons.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/required_documents/custom_tax_registration_section.dart';

class CustomRequiredDocumentsScreen extends StatelessWidget {
  const CustomRequiredDocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 16.h,
        children: [
          const CustomMandatoryDocumentsSection(),
          Divider(
            color: AppPallete.grayColor,
            thickness: 0.2.h,
            indent: 73.w,
            endIndent: 73.w,
          ),
          const CustomTaxRegistrationSection(),
           CustomNavigationButtons(onNextPressed: (){
            context.read<AddGymCubit>().goToNextPage();
          },),
        ],
      ),
    );
  }
}
