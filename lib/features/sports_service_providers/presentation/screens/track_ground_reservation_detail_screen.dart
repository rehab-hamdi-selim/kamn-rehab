import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/font_weight_helper.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/track_ground_reservation_details/track_ground_reservation_details_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/track_ground_reservation_details/track_ground_reservation_details_states.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/service_provider_ground_details/custome_image_slide_show.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/track_ground_reservation_details/custom_ground_reservation_detail_bloc_listner.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/track_ground_reservation_details/reservation_details_item.dart';

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
                child: CustomeImageSlideShow(playgroundModel.images!)),
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
                child: BlocBuilder<TrackGroundReservationsDetailsCubit,
                    TrackGroundsReservationDetailsState>(
                  buildWhen: (previous, current) => current.isSuccess,
                  builder: (context, state) {
                    if (state.isInitial || state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      print(state.playgroundsReservationDetails);
                    }
                    return Column(children: [
                      RPadding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Row(
                          children: [
                            const Text(
                              'Hadra Stadium East.1',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeightHelper.regular),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            ElevatedButton.icon(
                                onPressed: () {},
                                icon: SvgPicture.asset('assets/icons/edit.svg'),
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: AppPallete.lightBlackColor
                                      .withOpacity(.07),
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: AppPallete.lightBlackColor
                                              .withOpacity(.3),
                                          width: 1),
                                      borderRadius:
                                          BorderRadius.circular(30.w)),
                                ),
                                label: Text(
                                  'edit',
                                  style: TextStyles
                                      .font14RobotoLightBlackColorRegular,
                                ))
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount:
                                state.playgroundsReservationDetails!.length,
                            itemBuilder: (context, index) {
                              return ReservationDetailsItem(
                                data:
                                    state.playgroundsReservationDetails![index],
                              );
                            }),
                      )
                    ]);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
