import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/style.dart';

class LogoRow extends StatelessWidget {
  const LogoRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "assets/images/gym.png", 
          width: 50,
          height: 50,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Gold's Gym",
                style: TextStyles.fontCircularSpotify10BlackMedium
                    .copyWith(fontSize: 21.h)),
            Text("@goldsgymalex",
                style: TextStyles.fontCircularSpotify10StealGrayMedium),
          ],
        ),
      ],
    );
  }
}
