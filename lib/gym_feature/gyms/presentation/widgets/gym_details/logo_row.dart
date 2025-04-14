import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/style.dart';

class LogoRow extends StatelessWidget {
  const LogoRow({
    super.key,
    required this.logo, required this.gymName,
  });
  final String logo, gymName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          logo,
          width: 50,
          height: 50,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(gymName,
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
