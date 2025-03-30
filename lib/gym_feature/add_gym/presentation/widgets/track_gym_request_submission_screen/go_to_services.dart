import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/track_gym_request_submission_screen/submission_incomplete.dart';

class GoToServices extends StatelessWidget {
  const GoToServices({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPallete.accentBlackColor, // Dark background
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(70),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: 20.h, vertical: 10.w), // More padding
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const SubmissionIncomplete()),
          );
        },
        child: Text('Go to services',
            style: TextStyles.fontCircularSpotify14AccentBlackMedium.copyWith(
              color: AppPallete.lightWiteColor,
            )
            // Higher contrast
            ),
      ),
    );
  }
}
