import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_container.dart';
import 'package:kamn/core/utils/custom_gym_text_form_field.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_cubit.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/required_documents/custom_mandatory_field.dart';

class CustomMandatoryDocumentsSection extends StatelessWidget {
  const CustomMandatoryDocumentsSection({super.key});
  
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      alignment: CrossAxisAlignment.center,
      horizontalPadding: 10,
      children: [
        Text(
          'Mandatory Fields',
          style: TextStyles.fontCircularSpotify16BlackMedium,
        ),
        Text(
          'All mandatory documents must be clear, valid, and up-to-date.\nIncomplete or expired documents will prevent submission.',
          style: TextStyles.fontCircularSpotify10Gray2Regular,
        ),
        verticalSpace(12),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: Constants.mandatoryDocuments.length,
          separatorBuilder: (context, index) => verticalSpace(12),
          itemBuilder: (context, index) {
            final document =  Constants.mandatoryDocuments[index];
            return CustomMandatoryField(
              title: document.title,
              translation: document.translation,
              fontSize: document.fontSize?.h,
              index:index,
            );
          },
        ),
        verticalSpace(12),
        CustomGymTextFormField(
          controller:context.read<AddGymCubit>().contactController,
          label: 'Contact Number',
          hint: 'Enter valid phone number',
          optionalText: ' (Gym Phone)',
        ),
      ],
    );
  }
}