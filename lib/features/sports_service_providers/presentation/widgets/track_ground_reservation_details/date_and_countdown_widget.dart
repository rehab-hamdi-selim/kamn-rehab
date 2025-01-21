import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/sports/data/models/reservation_model.dart';

class DateAndCountdownWidget extends StatefulWidget {
  final Session session;

  const DateAndCountdownWidget({super.key, required this.session});

  @override
  State<DateAndCountdownWidget> createState() => _DateAndCountdownWidgetState();
}

class _DateAndCountdownWidgetState extends State<DateAndCountdownWidget> {
  late ValueNotifier<Duration> getRemainingDuration;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // Initialize the remaining duration
    getRemainingDuration = ValueNotifier<Duration>(
        widget.session.startAt.difference(DateTime.now()).isNegative
            ? Duration.zero
            : widget.session.startAt.difference(DateTime.now()));

    // Start the periodic timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final remainingDuration =
          widget.session.startAt.difference(DateTime.now());
      if (remainingDuration.isNegative) {
        // Stop the timer if the session has ended
        _timer?.cancel();
        getRemainingDuration.value = Duration.zero;
      } else {
        getRemainingDuration.value = remainingDuration;
      }
    });
  }

  @override
  void dispose() {
    // Dispose of the timer and ValueNotifier
    _timer?.cancel();
    getRemainingDuration.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45.r),
        color: AppPallete.lightGreen.withOpacity(.07),
        border: Border.all(color: AppPallete.lighterGreenColor, width: 1),
      ),
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
                DateFormat('EEEE, d MMM yyyy').format(widget.session.startAt),
                style: TextStyles.font14GreenRegular,
              ),
              Text(
                "${DateFormat.jm().format(widget.session.startAt)} to ${DateFormat.jm().format(widget.session.endAt)}",
                style: TextStyles.font14GreenRegular,
              ),
            ],
          ),
          const Spacer(flex: 1),
          ValueListenableBuilder<Duration>(
            valueListenable: getRemainingDuration,
            builder: (context, duration, child) {
              // Format the remaining duration to display as HH:mm:ss
              final hours = duration.inHours.toString().padLeft(2, '0');
              final minutes =
                  (duration.inMinutes % 60).toString().padLeft(2, '0');
              final seconds =
                  (duration.inSeconds % 60).toString().padLeft(2, '0');

              return Text(
                '$hours:$minutes:$seconds',
                style: TextStyles.font12GreenSemiBold
                    .copyWith(fontWeight: FontWeight.bold),
              );
            },
          ),
        ],
      ),
    );
  }
}
