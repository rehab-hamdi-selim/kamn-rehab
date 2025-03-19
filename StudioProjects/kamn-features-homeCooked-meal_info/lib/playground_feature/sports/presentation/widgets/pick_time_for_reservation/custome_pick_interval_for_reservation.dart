import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/utils/alert_dialog_utils.dart';
import 'package:kamn/playground_feature/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_cubit.dart';
import 'package:kamn/playground_feature/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_state.dart';

class CustomePickIntervalForReservation extends StatelessWidget {
  const CustomePickIntervalForReservation(
      {super.key,
      required this.interval,
      required this.isPicked,
      required this.day,
      required this.peroid,
      required this.check});

  final DateTime interval;
  final bool isPicked;
  final String day;
  final int peroid;
  final bool Function() check;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PickTimeForReservationCubit>();
    final appUserCubit = context.read<AppUserCubit>();

    return BlocBuilder<PickTimeForReservationCubit,
        PickTimeForReservationState>(
      builder: (context, state) {
        return !isPicked
            ? GestureDetector(
                onTap: () {
                  if (appUserCubit.isSpammer()) {
                    AlertDialogUtils.showAlert(
                      context: context,title: "Reservation Restricted",
                      content:
                          "Sorry, you can't make any reservation before paying cancellation fees.",
                      firstbutton: 'OK',
                      secondAction: () {},
                      secondbutton: 'Pay Now',
                    );
                    return;
                  }

                  final isSelected = cubit.viewModel.isSelected(interval, day);

                  if (isSelected || check.call()) {
                    cubit.onIntervalSelection(interval, day);
                  } else {
                    if (context.read<PickTimeForReservationCubit>().state.contuine) {
                      cubit.onIntervalSelection(interval, day);
                    } else {
                      AlertDialogUtils.showAlert(
                        context: context, 
                        title: 'Important Payment Information',
                        content:
                            'You cannot pay cash when selecting more than 2 sessions. A deposit is required.',
                        firstbutton: 'back',
                        secondAction: context.read<PickTimeForReservationCubit>().allowCountuine,
                        secondbutton: 'contiune',
                      );
                    }
                  }
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                  ),
                  width: 120.w,
                  decoration: BoxDecoration(
                    color: cubit.viewModel.isSelected(interval, day)
                        ? Colors.blueAccent
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: cubit.viewModel.isSelected(interval, day)
                          ? Colors.blue
                          : Colors.grey,
                      width: 2,
                    ),
                    boxShadow: cubit.viewModel.isSelected(interval, day)
                        ? [
                            BoxShadow(
                                color: Colors.blue.withOpacity(0.3),
                                blurRadius: 8,
                                spreadRadius: 2)
                          ]
                        : [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 4,
                                spreadRadius: 1)
                          ],
                  ),
                  child: Center(
                    child: Text(
                      '${DateFormat('HH:mm').format(interval)} to ${DateFormat('HH:mm').format(cubit.viewModel.getEndTime(interval, peroid))}',
                      style: TextStyle(
                        color: cubit.viewModel.isSelected(interval, day)
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            : Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                ),
                width: 120.w,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.redAccent,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 4,
                        spreadRadius: 1)
                  ],
                ),
                child: Center(
                  child: Text(
                    '${DateFormat('HH:mm').format(interval)} to ${DateFormat('HH:mm').format(cubit.viewModel.getEndTime(interval, peroid))}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
      },
    );
  }

 
}
