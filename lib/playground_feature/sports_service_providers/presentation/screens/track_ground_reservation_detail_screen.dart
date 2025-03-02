
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/playground_feature/sports/data/models/playground_model.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/cubit/track_ground_reservation_details/track_ground_reservation_details_cubit.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/cubit/track_ground_reservation_details/track_ground_reservation_details_states.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/widgets/service_provider_ground_details/custome_image_slide_show.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/widgets/track_ground_reservation_details/custom_ground_reservation_detail_bloc_listner.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/widgets/track_ground_reservation_details/reservation_details_item.dart';

class TrackGroundReservationDetail extends StatelessWidget {
  const TrackGroundReservationDetail(
      {super.key, required this.playgroundModel});
  final PlaygroundModel playgroundModel;

  @override
  Widget build(BuildContext context) {
    return CustomeGroundReservationDetailsBlocListner(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 346.h,
                // Image height
                child: CustomeImageSlideShow(imagesPath: playgroundModel.groundImages??[],)),
            Positioned(
              bottom: 0,
              // Start from the bottom
              left: 0,
              right: 0,
              height: 550.h,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Column(
                  children: [
                    verticalSpace(20.h),
                    Row(
                      children: [
                        Expanded(
                          child: Text(playgroundModel.playgroundName ?? '',
                              style: TextStyles.fontRoboto24BlackRegular
                                  .copyWith(height: .85),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                        ),
                        ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, Routes.editServiceScreen,
                                  arguments: playgroundModel);
                            },
                            icon: SvgPicture.asset('assets/icons/edit.svg'),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor:
                                  AppPallete.lightBlackColor.withOpacity(.07),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: AppPallete.lightBlackColor
                                          .withOpacity(.3),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(30.w)),
                            ),
                            label: Text(
                              'edit',
                              style:
                                  TextStyles.fontRoboto14LightBlackRegular,
                            ))
                      ],
                    ),
                    BlocBuilder<TrackGroundReservationsDetailsCubit,
                            TrackGroundsReservationDetailsState>(
                        builder: (context, state) {
                      if (state.isInitial || state.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Expanded(
                          child: ListView.builder(
                              itemCount:
                                  state.playgroundsReservationDetails!.length,
                              itemBuilder: (context, index) {
                                return ReservationDetailsItem(
                                  reservation: state
                                      .playgroundsReservationDetails![index],
                                );
                              }),
                        );
                      }
                    }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
