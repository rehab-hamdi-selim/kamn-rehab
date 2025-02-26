import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomIncomeOutcomeItem extends StatelessWidget {
  const CustomIncomeOutcomeItem(
      {super.key,
      required this.text,
      required this.money,
      required this.increase});

  final String text;
  final String money;
  final double increase;
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
                SvgPicture.asset('assets/icons/UserPlus.svg'),
                horizontalSpace(8),
                Text(
                  text,
                  style: TextStyles.fontInter9BlackLight,
                ),
                const Spacer(),
                const Icon(
                  Icons.more_vert,
                  size: 12,
                )
              ],
            ),
            verticalSpace(10.h),
            Text(
              money,
              style: TextStyles.fontInter24BlackMedium,
            ),
            verticalSpace(10.h),
            Row(
              children: [
                Icon(
                  increase < 0
                      ? Icons.arrow_circle_down_rounded
                      : Icons.arrow_circle_up_rounded,
                  size: 9,
                  color: increase < 0
                      ? AppPallete.redColor
                      : AppPallete.greenColor,
                ),
                RichText(
                  text: TextSpan(
                      text: '${increase.abs()}% ',
                      style: TextStyles.fontInter9LightGreyMedium.copyWith(
                        color: increase < 0
                            ? AppPallete.redColor
                            : AppPallete.greenColor,
                      ),
                      children: [
                        TextSpan(
                          text: 'Less than last month',
                          style: TextStyles.fontInter9LightGreyMedium,
                        ),
                      ]),
                ),
              ],
            ),
          ],
        ));
  }
}
