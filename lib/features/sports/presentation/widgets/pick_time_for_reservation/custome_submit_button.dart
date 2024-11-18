import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';
import 'package:kamn/features/sports/data/models/reservation_model.dart';
import 'package:kamn/features/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_cubit.dart';
import 'package:intl/intl.dart';

class CustomeSubmitButton extends StatelessWidget {
  final PlaygroundModel playground;
  const CustomeSubmitButton({super.key, required this.playground});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PickTimeForReservationCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 76.w),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10),
              disabledBackgroundColor: AppPallete.blackColor,
              backgroundColor: AppPallete.blackColor),
          onPressed: () {
            cubit.selectedIntervals.sort();
            DateTime lastTime =
                DateFormat.Hm().parse(cubit.selectedIntervals.last);
            lastTime = lastTime.add(Duration(minutes: playground.peroid ?? 60));
            cubit.onSubmitReservation(ReservationModel(
                groundId: playground.playgroundId,
                date: DateTime.now(),
                startAt: cubit.selectedIntervals.first,
                endAt: DateFormat.jm().format(lastTime),
                price: playground.price));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_outline,
                  color: AppPallete.lightGreen),
              horizontalSpace(7.w),
              Text(
                Constants.finish,
                style: TextStyles.fontInter16WhiteMedium,
              )
            ],
          )),
    );
  }
}
