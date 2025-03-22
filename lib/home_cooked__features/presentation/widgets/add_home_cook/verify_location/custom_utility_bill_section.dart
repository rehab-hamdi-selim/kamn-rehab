import 'package:flutter/material.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/add_home_cook/verify_location/custom_verify_utility_bill.dart'
    show CustomVerifyUtilityBillField;

import '../../../../../core/const/constants.dart';
import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/theme/style.dart';
import '../../../../../core/utils/custom_container.dart';

class CustomUtilityBillSection extends StatelessWidget {
  const CustomUtilityBillSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      alignment: CrossAxisAlignment.center,
      horizontalPadding: 10,
      children: [
        Text(
          'Utility Bill Upload',
          style: TextStyles.fontCircularSpotify16BlackMedium,
        ),
        Text(
          textAlign: TextAlign.center,
          'Upload a recent electricity or gas bill (within the last 3 months)\n showing your name and address..',
          style: TextStyles.fontCircularSpotify10Gray2Regular,
        ),
        verticalSpace(12),
        verticalSpace(15),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: Constants.utilityDocuments.length,
          separatorBuilder: (context, index) => verticalSpace(12),
          itemBuilder: (context, index) {
            final document = Constants.utilityDocuments[index];
            return CustomVerifyUtilityBillField(
              title: document.title,
              translation: document.translation,
              fontSize: document.fontSize,
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
    );
  }

  Widget bulletText(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("• ", style: TextStyle(fontSize: 15)),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 10),
          ),
        ),
      ],
    );
  }
}
