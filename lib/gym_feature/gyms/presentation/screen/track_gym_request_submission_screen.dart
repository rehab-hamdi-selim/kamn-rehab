import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/utils/custom_gym_app_bar.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/track_gym_request_submission_screen/contact_us.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/track_gym_request_submission_screen/go_to_services.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/track_gym_request_submission_screen/submission_incomplete.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/track_gym_request_submission_screen/submission_pending.dart';
import 'package:timelines_plus/timelines_plus.dart';

class TrackGymRequestSubmissionScreen extends StatelessWidget {
  TrackGymRequestSubmissionScreen({super.key});
  final List<String> steps = const [
    "Submission Received",
    "Under Review",
    "Approval",
  ];

  final List<String> descriptions = const [
    "Your submission has been successfully received and logged into our system.",
    "Our team is reviewing your gym's details, documents, and membership plans to ensure compliance with policies.",
    "Once the review is complete, we will notify you about the approval or required changes.",
  ];

  final List<Color> activeColors = const [
    Colors.green,
    Colors.orange,
    Colors.grey,
  ];
  final List<SvgPicture> icons = [
    SvgPicture.asset('assets/icons/check.svg'),
    SvgPicture.asset('assets/icons/under_review.svg'),
    SvgPicture.asset('assets/icons/approval.svg'),
  ];
  final int currentStep = 2;
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
              child: Timeline.tileBuilder(
                shrinkWrap: true, // Ensures it does not take unnecessary space
                theme: TimelineThemeData(
                  nodePosition: 0,
                  indicatorPosition: 0,
                  direction: Axis.vertical,
                  connectorTheme: const ConnectorThemeData(thickness: 2),
                ),
                builder: TimelineTileBuilder.connected(
                  contentsAlign: ContentsAlign.basic, // Forces left alignment
                  itemCount: steps.length,
                  contentsBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0), // Pushes content to right of icons
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Ensures text aligns left
                      children: [
                        Text(
                          steps[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: index < currentStep
                                ? activeColors[index]
                                : Colors.grey,
                          ),
                        ),
                        Text(
                          descriptions[index],
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),
                  indicatorBuilder: (context, index) {
                    return DotIndicator(
                      size: 25.r,
                      color: index < currentStep
                          ? activeColors[index]
                          : Colors.grey,
                      child: Padding(
                          padding: EdgeInsets.all(4.r), child: icons[index]),
                    );
                  },
                  connectorBuilder: (context, index, connectorType) => SizedBox(
                    height: 70.h,
                    child: SolidLineConnector(
                      space: 10.h,
                      endIndent: 10.h,
                      indent: 10.h,
                      color: index < currentStep - 1
                          ? activeColors[index]
                          : Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
            ),

            // Expanded(
            //   child: SingleChildScrollView(
            //     child: Column(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         BuildTimelineTile(
            //           descriptionColor: AppPallete.accentBlackColor,
            //           isFirst: true,
            //           isLast: false,
            //           isDone: true,
            //           icon: SvgPicture.asset('assets/icons/user.svg'),
            //           ////// using list.svg

            //           iconColor: Colors.red,
            //           title: "Submission Received",
            //           description:
            //               "Your submission has been successfully received and logged into our system.",
            //           titleColor: Colors.green,
            //         ),
            //         BuildTimelineTile(
            //           descriptionColor: AppPallete.accentBlackColor,
            //           isFirst: false,
            //           isLast: false,
            //           isReview: true,
            //           icon: SvgPicture.asset('assets/icons/user.svg'),
            //           ////// using correct.svg

            //           iconColor: Colors.green,
            //           title: "Under Review",
            //           description:
            //               "Our team has completed the review of your documents and details.",
            //           titleColor: AppPallete.lightDeepOrangeColor,
            //         ),
            //         BuildTimelineTile(
            //           descriptionColor: AppPallete.accentBlackColor,
            //           isFirst: false,
            //           isLast: true,
            //           icon: SvgPicture.asset('assets/icons/user.svg'),
            //           iconColor: AppPallete.darkGreyColor,
            //           title: "Approval",
            //           description:
            //               "Once the review is complete, we will notify you about the approval or required changes.",
            //           titleColor: AppPallete.lightGreyColor,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // const SubmissionIncomplete(),
            // SizedBox(
            //   height: 17.h,
            // ),
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
