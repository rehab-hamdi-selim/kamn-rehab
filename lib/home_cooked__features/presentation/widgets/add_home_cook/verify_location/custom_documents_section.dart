import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_container.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/add_home_cook/verify_location/custom_home_address.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/add_home_cook/verify_location/custom_national_id_section.dart'
    show CustomNationalIdSection;
import 'package:kamn/home_cooked__features/presentation/widgets/add_home_cook/verify_location/custom_utility_bill_section.dart'
    show CustomUtilityBillSection;
import 'package:kamn/home_cooked__features/presentation/widgets/add_home_cook/verify_location/custom_verify_utility_bill.dart';

class CustomDocumentsSection extends StatelessWidget {
  const CustomDocumentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHomeAddress(),
        verticalSpace(10),
        const CustomNationalIdSection(),
        verticalSpace(10),
        const CustomUtilityBillSection(),
      ],
    );
  }
}
