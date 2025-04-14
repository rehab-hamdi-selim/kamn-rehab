import 'package:flutter/material.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/font_weight_helper.dart';
import 'package:kamn/core/theme/style.dart';

class ReadMoreText extends StatelessWidget {
  const ReadMoreText({
    super.key, required this.gymDescription,
  });

  final String gymDescription;
  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
        text: gymDescription,
        style: TextStyles.fontCircularSpotify14LightBlackRegular
            .copyWith(fontWeight: FontWeightHelper.light),
      ),
      TextSpan(
          text: "Read More",
          style: TextStyles.fontCircularSpotify12BlackMedium
              .copyWith(color: AppPallete.orangeAccentColor)),
    ]));
  }
}
