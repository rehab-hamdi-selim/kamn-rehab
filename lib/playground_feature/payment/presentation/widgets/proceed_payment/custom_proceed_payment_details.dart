import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/playground_feature/sports/data/models/reservation_model.dart';

class CustomProceedPaymentDetails extends StatelessWidget {
  const CustomProceedPaymentDetails(
      {super.key, required this.reservationModel});
  final ReservationModel reservationModel;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Category Text
      Text(
        reservationModel.ground?.type ?? '',
        style: TextStyles.fontRoboto16GreenMedium.copyWith(color: Sport.values
                          .firstWhere((element) =>
                              element.displayName == reservationModel.ground?.type)
                          .sportColor),
      ),
      Text(
        reservationModel.ground?.playgroundName ?? '',
        style: TextStyles.fontRoboto30AccentBlackMedium,
      ),
      verticalSpace(53.h),
      // Price Text
      Text(
        '${reservationModel.price} LE',
        style: TextStyles.fontRoboto45BlackMedium,
      ),
      verticalSpace(36.h),
      Text(
          DateFormat('EEEE, d MMM yyyy')
              .format(reservationModel.startAt ?? DateTime.now()),
          style: TextStyles.fontRobto14AccentBlackLight),
      verticalSpace(7.h),
      Text(
        "${DateFormat.jm().format(reservationModel.startAt ?? DateTime.now())} to ${DateFormat.jm().format(reservationModel.endAt ?? DateTime.now())}",
        style: TextStyles.fontRobto14AccentBlackLight,
      ),
    ]);
  }
}
