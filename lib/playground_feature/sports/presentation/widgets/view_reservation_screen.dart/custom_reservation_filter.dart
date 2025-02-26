import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/app_images.dart';
import 'package:kamn/playground_feature/sports/presentation/widgets/grounds_screen/custom_bottom.dart';
import 'package:kamn/playground_feature/sports/presentation/widgets/grounds_screen/custom_text_form_field.dart';

class CustomReservationFilter extends StatelessWidget {
  const CustomReservationFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomTextFormField(controller: TextEditingController())),
        horizontalSpace(5),
        CustomBottom(
          iconVisible: true,
          iconWidget: Image.asset(
            AppImages.filterImage,
            width: 15.w,
            height: 15.h,
          ),
          onPressed: () {},
          textBottom: 'Filter',
          textStyle: TextStyles.fontRoboto12WhiteMedium,
        ),
      ],
    );
  }
}
