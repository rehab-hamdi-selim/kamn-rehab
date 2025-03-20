import 'package:flutter/material.dart';

import 'package:kamn/core/theme/style.dart';

class customTittleText extends StatelessWidget {
  const customTittleText({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyles.fontCircularSpotify16BlackMedium,
    );
  }
}

class customTittleTextMealReview extends StatelessWidget {
  const customTittleTextMealReview({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyles.fontCircularSpotify17BlackRegular,
    );
  }
}
