import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/helpers/validators.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_container.dart';
import 'package:kamn/core/utils/custom_gym_text_form_field.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/add_home_cook/add_gym_cubit.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/add_home_cook/verify_location/custom_home_address.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/add_home_cook/verify_location/custom_mandatory_field.dart';

class CustomMandatoryDocumentsSection extends StatelessWidget {
  const CustomMandatoryDocumentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      alignment: CrossAxisAlignment.center,
      horizontalPadding: 10,
      children: [
        Text(
          'Utility Bill Upload ',
          style: TextStyles.fontCircularSpotify16BlackMedium,
        ),
        Text(
          'Upload a recent electricity or gas bill (within the last 3 months)\n showing your name and address..',
          style: TextStyles.fontCircularSpotify10Gray2Regular,
        ),
        verticalSpace(12),
        CustomHomeAddress(),
        verticalSpace(15),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: Constants.mandatoryDocuments.length,
          separatorBuilder: (context, index) => verticalSpace(12),
          itemBuilder: (context, index) {
            final document = Constants.mandatoryDocuments[index];
            return CustomMandatoryField(
              title: document.title,
              translation: document.translation,
              fontSize: document.fontSize?.h,
              index: index,
            );
          },
        ),
        verticalSpace(12),
        Form(
          key: context.read<AddHomeCookCubit>().requiredDocumentsKey,
          child: CustomGymTextFormField(
            controller: context.read<AddHomeCookCubit>().contactController,
            label: 'Contact Number',
            hint: 'Enter valid phone number',
            optionalText: ' (Gym Phone)',
            valodator: phoneValidator,
          ),
        ),
      ],
    );
  }
}
