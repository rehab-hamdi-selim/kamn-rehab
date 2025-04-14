import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kamn/core/theme/style.dart';

class SubmissionPendingContainer extends StatelessWidget {
  const SubmissionPendingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              'assets/icons/pending.png',
            ),
            //  Image.asset('assets/images/submission.png'),
            Text("Submission Pending",
                style: TextStyles.fontCircularSpotify20accentBlackColorMedium),
          ],
        ),
        Text(
            "Your gym submission is under review. Our team will contact you once the process is complete",
            style: TextStyles.fontCircularSpotify10darkGreyColorRegular),
      ],
    );
  }
}
