import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding:  EdgeInsets.all(4.w),
          decoration: BoxDecoration(
              color: AppPallete.shadeOfGray,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            spacing: 4,
            children: [
              Text(
                "4.8",
                style: TextStyles.fontCircularSpotify10BlackRegular,
              ),
              const Icon(Icons.star, color: Colors.orangeAccent, size: 12),
            ],
          ),
        ),
        Text(
          " (200+ reviews)",
          style: TextStyles.fontCircularSpotify8StealGrayRegular,
        ),
      ],
    );
  }
}
