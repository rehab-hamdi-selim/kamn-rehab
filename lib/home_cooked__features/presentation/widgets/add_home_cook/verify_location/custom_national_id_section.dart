import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_container.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/add_home_cook/verify_location/custom_verify_national_id.dart';

class CustomNationalIdSection extends StatelessWidget {
  const CustomNationalIdSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      alignment: CrossAxisAlignment.center,
      horizontalPadding: 10,
      children: [
        Text(
          'National ID Card',
          style: TextStyles.fontCircularSpotify16BlackMedium,
        ),
        Text(
          textAlign: TextAlign.center,
          'Upload a clear image of your valid Egyptian National ID',
          style: TextStyles.fontCircularSpotify10Gray2Regular,
        ),
        verticalSpace(12),
        verticalSpace(15),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: Constants.nationalIdFrontAndBack.length,
          separatorBuilder: (context, index) => verticalSpace(12),
          itemBuilder: (context, index) {
            final document = Constants.nationalIdFrontAndBack[index];
            return CustomVerifyNationalIdField(
              title: document.title,
              translation: document.translation,
              fontSize: document.fontSize?.h,
              index: index,
            );
          },
        ),
      ],
    );
  }
}
