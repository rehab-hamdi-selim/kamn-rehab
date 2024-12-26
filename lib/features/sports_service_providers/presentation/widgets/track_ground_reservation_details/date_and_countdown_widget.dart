import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/font_weight_helper.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:kamn/features/admin/presentation/widgets/second_page/custom_expacted_earning_chart_data.dart';
import 'package:kamn/features/sports/data/models/reservation_model.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/track_ground_reservation_details/track_ground_reservation_details_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/track_ground_reservations/track_ground_reservations_cubit.dart';

class DateAndCountdownWidget extends StatelessWidget {
  final Session data;
  final ReservationModel reservation;
  const DateAndCountdownWidget(
      {super.key, required this.data, required this.reservation});
  @override
  Widget build(BuildContext context) {
    DateTime start = data.startAt;
    int startTime = start.millisecondsSinceEpoch + 1000;
    return RPadding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        decoration: BoxDecoration(
            color: AppPallete.whiteGreenColor,
            borderRadius: BorderRadius.circular(30.r)),
        child: RPadding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.calendar_month_outlined),
                  const Spacer(
                    flex: 1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('EEEE, dd MMM yyyy').format(data.startAt),
                        style: const TextStyle(color: AppPallete.greenColor),
                      ),
                      const Text('6:30 PM to 7:30 PM',
                          style: TextStyle(color: AppPallete.greenColor))
                    ],
                  ),
                  const Spacer(
                    flex: 9,
                  ),
                  CountdownTimer(
                    endTime: startTime,
                    widgetBuilder: (_, time) {
                      if (time == null) {
                        return const Text('Game over');
                      }
                      return Text(
                          '${(time.days == null) ? 0 : time.days}:${(time.hours == null) ? 0 : time.hours}:${(time.min == null) ? 0 : time.min}:${(time.sec == null) ? 0 : time.sec}',
                          style: const TextStyle(
                              color: AppPallete.greenColor,
                              fontWeight: FontWeightHelper.semiBold));
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('debug');
                      print(reservation.reservationId);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppPallete.lightGreen),
                    child: const Text(
                      'Confirm',
                      style: TextStyle(
                          color: AppPallete.accentBlackColor,
                          fontWeight: FontWeightHelper.regular),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context
                            .read<TrackGroundReservationsDetailsCubit>()
                            .changeReservationState(
                                reservation.reservationId!,
                                {'status': 'cancelled'}
                                    as Map<String, dynamic>);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppPallete.redColor),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            color: AppPallete.accentBlackColor,
                            fontWeight: FontWeightHelper.regular),
                      )),
                  const Spacer(
                    flex: 1,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppPallete.yellowColor,
                      ),
                      child: const Text(
                        'Report',
                        style: TextStyle(
                            color: AppPallete.accentBlackColor,
                            fontWeight: FontWeightHelper.regular),
                      )),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
