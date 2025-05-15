import 'package:flutter/material.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/font_weight_helper.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:readmore/readmore.dart';

class CustomReadMoreText extends StatelessWidget {
  const CustomReadMoreText({
    super.key, 
    required this.gymDescription,
  });

  final String gymDescription;
  
  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      gymDescription,
      trimLines: 3,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Read More',
      trimExpandedText: 'Show Less',
      style: TextStyles.fontCircularSpotify14LightBlackRegular
          .copyWith(fontWeight: FontWeightHelper.light),
      moreStyle: TextStyles.fontCircularSpotify12BlackMedium
          .copyWith(color: AppPallete.orangeAccentColor),
      lessStyle: TextStyles.fontCircularSpotify12BlackMedium
          .copyWith(color: AppPallete.orangeAccentColor),
    );
  }
}
