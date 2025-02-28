import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_gym_text_form_field.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_gym_info_section.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_mandatory_field.dart';

class CustomRequiredDocumentsSection extends StatelessWidget {
  const CustomRequiredDocumentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: IntrinsicHeight(
        child: Column(
          spacing: 16.h,
          children: [
            _buildMandatoryDocumentsSection(),
            _buildDivider(),
            _buildTaxRegistrationSection(),
            _buildNavigationButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildMandatoryDocumentsSection() {
    return buildContainer(
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
        verticalSpace(12.h),
        const CustomMandatoryField(
          title: 'Gym Operating License',
          translation: 'رخصه تشغيل الجيم',
        ),
        verticalSpace(12.h),
        const CustomMandatoryField(
          title: 'ID or Passport of Owner',
          translation: 'صورة البطاقة الشخصية أو جواز السفر لصاحب الملكيه/الجيم',
        ),
        verticalSpace(12.h),
        const CustomMandatoryField(
          title: 'Ownership Contract',
          translation: 'عقد ايجار او ملكيه المكان',
        ),
        verticalSpace(12.h),
        CustomGymTextFormField(
          controller: TextEditingController(),
          label: 'Contact Number',
          hint: 'Enter valid phone number',
          optionalText: ' (Gym Phone)',
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: AppPallete.greyColor,
      thickness: 0.2.h,
      indent: 73.w,
      endIndent: 73.w,
    );
  }

  Widget _buildTaxRegistrationSection() {
    return buildContainer(
      alignment: CrossAxisAlignment.center,
      horizontalPadding: 10,
      children: [
        Text(
          'Mandatory Fields',
          style: TextStyles.fontCircularSpotify16BlackMedium,
        ),
        verticalSpace(12.h),
        const CustomMandatoryField(
          title: 'Tax Registration',
          translation: 'البطاقة الضريبية او التسجيل الضريبي',
        ),
      ],
    );
  }

  Widget _buildNavigationButtons() {
    return Row(
      spacing: 12.w,
      children: [
        buildBackButton(),
        buildNextButton(),
      ],
    );
  }
}
