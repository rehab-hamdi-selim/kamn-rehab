import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/di/di.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/utils/custom_gym_app_bar.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/track_submission/track_submission_cubit.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/track_submission/track_submission_state.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/track_gym_request_submission_screen/add_mempership_offer_card.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/track_gym_request_submission_screen/contact_us.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/track_gym_request_submission_screen/go_to_services.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/track_gym_request_submission_screen/submission_incomplete.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/track_gym_request_submission_screen/submission_pending.dart';
import 'package:timelines_plus/timelines_plus.dart';

class TrackSubmissionScreen extends StatelessWidget {
  const TrackSubmissionScreen({super.key, required this.gymId});
  final String gymId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = getIt<TrackSubmissionCubit>();
        // First get the gym data, then update status when complete
        cubit.getGym(gymId).then((_) {
          cubit.updateStatus();
          cubit.check();
        });
        return cubit;
      },
      child: Scaffold(
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
                child: BlocBuilder<TrackSubmissionCubit, TrackSubmissionState>(
                  builder: (context, state) => Timeline.tileBuilder(
                    shrinkWrap:
                        true, // Ensures it does not take unnecessary space
                    theme: TimelineThemeData(
                      nodePosition: 0,
                      indicatorPosition: 0,
                      direction: Axis.vertical,
                      connectorTheme: const ConnectorThemeData(thickness: 2),
                    ),
                    builder: TimelineTileBuilder.connected(
                      contentsAlign:
                          ContentsAlign.basic, // Forces left alignment
                      itemCount: state.stepsInfo.length,
                      contentsBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0), // Pushes content to right of icons
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Ensures text aligns left
                          children: [
                            Text(
                              state.stepsInfo[index].title,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: state.stepsInfo[index].color),
                            ),
                            Text(
                              state.stepsInfo[index].description,
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      ),
                      indicatorBuilder: (context, index) {
                        return DotIndicator(
                          size: 25.r,
                          color: state.stepsInfo[index].color,
                          child: Padding(
                              padding: EdgeInsets.all(4.r),
                              child: state.stepsInfo[index].icon),
                        );
                      },
                      connectorBuilder: (context, index, connectorType) =>
                          SizedBox(
                        height: 70.h,
                        child: SolidLineConnector(
                            space: 10.h,
                            endIndent: 10.h,
                            indent: 10.h,
                            color: state.stepsInfo[index].color),
                      ),
                    ),
                  ),
                ),
              ),
              verticalSpace(10),
              BlocBuilder<TrackSubmissionCubit, TrackSubmissionState>(
                builder: (context, state) {
                  if (state.isApproved) {
                    return const AddMempershipOfferCard();
                  } else if (state.isRejected) {
                    return Column(
                      children: [
                        const SubmissionIncomplete(),
                        verticalSpace(10),
                        const ContactUs(),
                      ],
                    );
                  } else {
                    return const ContactUs();
                  }
                },
              ),
              SizedBox(
                height: 17.h,
              ),
              const GoToServices(),
            ],
          ),
        ),
      ),
    );
  }
}
