import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomIncomeOutcomeItem extends StatelessWidget {
  const CustomIncomeOutcomeItem(
      {super.key, required this.text, required this.money});

  final String text;
  final String money;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
            border: Border.all(
              color: AppPallete.ligtGreyColor.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.person_add_alt_1,
                  color: AppPallete.blackColor,
                  size: 20.w,
                ),
                horizontalSpace(8),
                Text(
                  text,
                  style: TextStyles.fontInter9BlackLight,
                ),
                const Spacer(),
                const Icon(
                  Icons.list,
                  size: 12,
                )
              ],
            ),
            verticalSpace(10.h),
            Text(
              money,
              style: TextStyles.font24BlackInterColorMedium,
            ),
            verticalSpace(10.h),
            Row(
              children: [
                const Icon(
                  Icons.arrow_downward_outlined,
                  size: 9,
                  color: AppPallete.redColor,
                ),
                RichText(
                  text: TextSpan(
                      text: '2.5 % ',
                      style: TextStyles.fontInter9LightGreyMudium
                          .copyWith(color: AppPallete.redColor),
                      children: [
                        TextSpan(
                          text: 'Less than last month',
                          style: TextStyles.fontInter9LightGreyMudium,
                        ),
                      ]),
                ),
              ],
            ),
          ],
        ));
  }
}
