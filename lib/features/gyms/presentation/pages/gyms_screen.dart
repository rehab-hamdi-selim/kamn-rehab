import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

import 'package:kamn/features/gyms/presentation/widgets/custom_gym_appbar.dart';

class GymsScreen extends StatelessWidget {
  const GymsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomGymAppbar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Find Your Fit',
                  style: TextStyles.font20CircularSpotifyTextAccentBlackMedium,
                ),
                const Spacer(),
                ElevatedButton(
                    onPressed: () {},
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
            ),
          ],
        ),
      ),
    );
  }
}
