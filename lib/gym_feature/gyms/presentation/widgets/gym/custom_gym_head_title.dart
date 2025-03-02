import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
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
          style: TextStyles.font20CircularSpotifyTextAccentBlackMedium,
        ),
        const Spacer(),
        ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
                elevation: 1,
                backgroundColor: AppPallete.lighttColor2,
                minimumSize: Size(60.w, 20.h),
                padding: const EdgeInsets.all(0)),
            child: Text(
              'View more',
              style: TextStyles.fontCircularSpotify10RegularAccent,
            ))
      ],
    );
  }
}
