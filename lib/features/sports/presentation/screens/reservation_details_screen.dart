import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';
import 'package:kamn/features/sports/data/models/reservation_model.dart';
import 'package:kamn/features/sports/presentation/widgets/reservation_details/custome_bottom_bar.dart';
import 'package:kamn/features/sports/presentation/widgets/reservation_details/custome_image_slide_show.dart';
import 'package:kamn/features/sports/presentation/widgets/reservation_details/custome_play_ground_info.dart';

class ReservationDetailsScreen extends StatelessWidget {
  const ReservationDetailsScreen({
    required this.reservation,
    super.key,
  });
  final ReservationModel reservation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: CustomeImageSlideShow(
                    imagesPath: reservation.ground?.groundImages ?? [])),
            Positioned(
              bottom: 0,
              // Start from the bottom
              left: 0,
              right: 0,
              height: 440.h,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: CustomePlayGroundInfo(
                  reservationModel: reservation,
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: CustomeBottomBar(
          reservationModel: reservation,
        ));
  }
}
