import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/playground_feature/sports/data/models/reservation_model.dart';

class CustomSuccessAlertDailog extends StatelessWidget {
  final ReservationModel reservationModel;
  const CustomSuccessAlertDailog({super.key, required this.reservationModel});
  final double width = 316;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: 316,
        height: 378,
        child: CustomPaint(
            size: Size(
                width,
                (width * 1.1645569620253164)
                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: RPSCustomPainter(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.check_circle_outline_rounded,
                    size: 130, color: AppPallete.lightGreenColor),
                verticalSpace(15),
                Text('Thanks for Booking',
                    style: TextStyles.fontRoboto24BoldBlack),
                verticalSpace(10),
                Text(
                    'you booked in ${reservationModel.ground?.playgroundName ?? ""}',
                    style: TextStyles.font16blackRegular
                        .copyWith(fontWeight: FontWeight.w300)),
                verticalSpace(15),
                Text(
                  DateFormat('EEEE, d MMM yyyy')
                      .format(reservationModel.startAt ?? DateTime.now()),
                  style: TextStyles.font14GreenRegular,
                ),
                verticalSpace(7),
                Text(
                  "${DateFormat.jm().format(reservationModel.startAt ?? DateTime.now())} to ${DateFormat.jm().format(reservationModel.endAt ?? DateTime.now())}",
                  style: TextStyles.font14GreenRegular,
                ),
                verticalSpace(15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppPallete.lightGreenColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 35,
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    'Ok',
                    style: TextStyles.font24WhiteInterColorMedium.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                verticalSpace(5),
              ],
            )),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Paint for fill
    Paint paintFill = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill;

    // Paint for stroke
    Paint paintStroke = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    // Start path with arch corners
    Path path = Path();

    // Top-left arch corner
    path.moveTo(0, size.height * 0.1587302 + 25);
    path.arcTo(
      Rect.fromCircle(
          center: Offset(25, size.height * 0.1587302 + 25), radius: 25),
      3.14,
      1.57,
      false,
    );

    // Top edge
    path.lineTo(size.width * 0.3811392 - 25, size.height * 0.1587302);

    // Top curve
    path.quadraticBezierTo(size.width * 0.3386076, size.height * 0.0067935,
        size.width * 0.5000000, 0);
    path.quadraticBezierTo(size.width * 0.6582278, size.height * 0.0067935,
        size.width * 0.6941139, size.height * 0.1426630);

    // Top-right arch corner
    path.arcTo(
      Rect.fromCircle(
          center: Offset(size.width - 25, size.height * 0.1587302 + 20),
          radius: 25),
      -1.57,
      1.57,
      false,
    );

    // Right edge
    path.lineTo(size.width, size.height - 25);

    // Bottom-right arch corner
    path.arcTo(
      Rect.fromCircle(
          center: Offset(size.width - 25, size.height - 25), radius: 25),
      0,
      1.57,
      false,
    );

    // Bottom edge
    path.lineTo(25, size.height);

    // Bottom-left arch corner
    path.arcTo(
      Rect.fromCircle(center: Offset(25, size.height - 25), radius: 25),
      1.57,
      1.57,
      false,
    );

    // Left edge
    path.lineTo(0, size.height * 0.1587302 + 25);

    path.close();

    // Draw the filled path
    canvas.drawPath(path, paintFill);

    // Draw the stroked path
    canvas.drawPath(path, paintStroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
