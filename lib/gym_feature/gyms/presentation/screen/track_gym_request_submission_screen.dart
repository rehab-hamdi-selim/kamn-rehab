import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/utils/custom_gym_app_bar.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/track_gym_request_submission_screen/build_timeline_tile.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/track_gym_request_submission_screen/contact_us.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/track_gym_request_submission_screen/go_to_services.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/track_gym_request_submission_screen/submission_pending.dart';

class TrackGymRequestSubmissionScreen extends StatelessWidget {
  const TrackGymRequestSubmissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.whiteColor,
      appBar: CustomGymAppBar.appBar(
        color: AppPallete.whiteColor,
        context: context,
        notificationIconFunction: () {},
        badgesIconFunction: () {},
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SubmissionPendingContainer(),
            SizedBox(
              height: 64.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BuildTimelineTile(
                      descriptionColor: AppPallete.accentBlackColor,
                      isFirst: true,
                      isLast: false,
                      isDone: true,
                      icon: SvgPicture.asset('assets/icons/user.svg'),
                      ////// using list.svg

                      iconColor: Colors.red,
                      title: "Submission Received",
                      description:
                          "Your submission has been successfully received and logged into our system.",
                      titleColor: Colors.green,
                    ),
                    BuildTimelineTile(
                      descriptionColor: AppPallete.accentBlackColor,
                      isFirst: false,
                      isLast: false,
                      isReview: true,
                      icon: SvgPicture.asset('assets/icons/user.svg'),
                      ////// using correct.svg

                      iconColor: Colors.green,
                      title: "Under Review",
                      description:
                          "Our team has completed the review of your documents and details.",
                      titleColor: AppPallete.lightDeepOrangeColor,
                    ),
                    BuildTimelineTile(
                      descriptionColor: AppPallete.accentBlackColor,
                      isFirst: false,
                      isLast: true,
                      icon: SvgPicture.asset('assets/icons/user.svg'),
                      iconColor: AppPallete.darkGreyColor,
                      title: "Approval",
                      description:
                          "Once the review is complete, we will notify you about the approval or required changes.",
                      titleColor: AppPallete.lightGreyColor,
                    ),
                  ],
                ),
              ),
            ),
            const ContactUs(),
            SizedBox(
              height: 17.h,
            ),
            const GoToServices(),
          ],
        ),
      ),
    );
  }
}
