import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_container.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/add_home_cook/verify_location/custom_home_address.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/add_home_cook/verify_location/custom_verify_mandatory_field.dart';

class CustomMandatoryDocumentsSection extends StatelessWidget {
  const CustomMandatoryDocumentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHomeAddress(),
        SizedBox(
          height: 10,
        ),
        CustomContainer(
          alignment: CrossAxisAlignment.center,
          horizontalPadding: 10,
          children: [
            Text(
              'Utility Bill Upload',
              style: TextStyles.fontCircularSpotify16BlackMedium,
            ),
            Text(
              'Upload a recent electricity or gas bill (within the last 3 months)\n showing your name and address..',
              style: TextStyles.fontCircularSpotify10Gray2Regular,
            ),
            verticalSpace(12),
            verticalSpace(15),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: Constants.mandatoryDocuments.length,
              separatorBuilder: (context, index) => verticalSpace(12),
              itemBuilder: (context, index) {
                final document = Constants.mandatoryDocuments[index];
                return CustomVerifyMandatoryField(
                  title: document.title,
                  translation: document.translation,
                  fontSize: document.fontSize?.h,
                  index: index,
                );
              },
            ),
            verticalSpace(12),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bulletText("Important Guidelines:"),
                  bulletText("Must be issued within the last 3 months."),
                  bulletText(
                      "Clearly show your name and address matching your registration details."),
                  bulletText("File accepted: PDF, JPG, PNG (max size: 5MB)."),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget bulletText(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("• ", style: TextStyle(fontSize: 15)),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 10),
          ),
        ),
      ],
    );
  }
}
