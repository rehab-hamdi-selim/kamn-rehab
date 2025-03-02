import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/playground_feature/sports/presentation/cubits/reservation_details_cubit/reservation_details_cubit.dart';

class CustomSessionCountDown extends StatelessWidget {
  const CustomSessionCountDown({
    super.key,
    required this.startAt,
    required this.endAt,
  });
  final DateTime startAt;
  final DateTime endAt;

  @override
  Widget build(BuildContext context) {
    context.read<ReservationDetailsCubit>().setTargetTime(startAt);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45.r),
          color: AppPallete.lightGreen.withOpacity(.07),
          border: Border.all(color: AppPallete.lighterGreenColor, width: 1)),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/reservation.svg",
          ),
          horizontalSpace(7.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat('EEEE, d MMM yyyy').format(startAt),
                style: TextStyles.fontRoboto14GreenRegular,
              ),
              Text(
                "${DateFormat.jm().format(startAt)} to ${DateFormat.jm().format(endAt)}",
                style: TextStyles.fontRoboto14GreenRegular,
              )
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          ValueListenableBuilder<Duration>(
            valueListenable:
                context.read<ReservationDetailsCubit>().countdownDuration!,
            builder: (context, duration, child) {
              // Format the remaining duration to display as HH:mm:ss
              final hours = duration.inHours.toString().padLeft(2, '0');
              final minutes =
                  (duration.inMinutes % 60).toString().padLeft(2, '0');
              final seconds =
                  (duration.inSeconds % 60).toString().padLeft(2, '0');

              return Text('$hours:$minutes:$seconds',
                  style: TextStyles.fontRoboto12GreenSemiBold
                      .copyWith(fontWeight: FontWeight.bold));
            },
          )
        ],
      ),
    );
  }
}
