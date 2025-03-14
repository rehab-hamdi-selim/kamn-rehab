import 'package:flutter/material.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_container.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/required_documents/custom_mandatory_field.dart';

class CustomTaxRegistrationSection extends StatelessWidget {
  const CustomTaxRegistrationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
    alignment: CrossAxisAlignment.center,
    horizontalPadding: 10,
    children: [
      Text(
        'Optional Fields',
        style: TextStyles.fontCircularSpotify16BlackMedium,
      ),
      verticalSpace(12),
      const CustomMandatoryField(
        title: 'Tax Registration',
        translation: 'البطاقة الضريبية او التسجيل الضريبي',
      ),
    ],
  );
  }
}