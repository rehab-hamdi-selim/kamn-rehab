import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/style.dart';

class CustomGymHeadTitle extends StatelessWidget {
  const CustomGymHeadTitle(
      {super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyles.fontCircularSpotify20AccentBlackMedium,
        ),
        const Spacer(),
        ElevatedButton.icon(
            onPressed: onTap,
            iconAlignment: IconAlignment.end,
            icon: const Icon(Icons.keyboard_arrow_right_outlined),
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                minimumSize: Size(60.w, 20.h),
                padding: const EdgeInsets.all(0)),
            label: Text(
              'View more',
              style: TextStyles.fontCircularSpotify10BlackRegular,
            )), 
            
      ],
    );
  }
}
