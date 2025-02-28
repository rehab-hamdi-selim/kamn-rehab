import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/playground_feature/sports/data/models/reservation_model.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/widgets/track_ground_reservation_details/date_and_countdown_widget.dart';
import 'package:url_launcher/url_launcher.dart';



class ReservationDetailsItem extends StatelessWidget {
  final ReservationModel reservation;
  const ReservationDetailsItem({super.key, required this.reservation});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppPallete.ofWhiteColor.withOpacity(0.07),
        border: Border.all(color: AppPallete.whiteGreenColor, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.person_outlined),
                const Spacer(flex: 1),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Reserved by :',
                      style: TextStyle(color: AppPallete.grayColor),
                    ),
                    Text(
                      reservation.user?.name ?? '',
                      style: const TextStyle(color: AppPallete.greenColor),
                    ),
                  ],
                ),
                const Spacer(flex: 9),
                const Icon(Icons.call_outlined),
                GestureDetector(
                  onTap: () async {
                    final Uri launchUri = Uri(
                      scheme: 'tel',
                      path:  '012111111111', // Use dynamic phone
                    );
                    await launchUrl(launchUri);
                  },
                  child: const Text(
                     '012111111111', // Use dynamic phone
                    style: TextStyle(color: AppPallete.greenColor),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.check_circle_outline),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reservation.paymentMethod ?? '',
                        style: const TextStyle(color: AppPallete.grayColor),
                      ),
                      Text(
                        'Paid: ${reservation.price} / hr',
                        style: const TextStyle(color: AppPallete.greenColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (reservation.sessions != null && reservation.sessions!.isNotEmpty)
              ListView.separated(separatorBuilder: (context, index) => verticalSpace(5.h),
 
                shrinkWrap: true, // Makes the ListView take only the needed space
                physics: const NeverScrollableScrollPhysics(), // Disables scrolling
                itemCount: reservation.sessions?.length??0,
                itemBuilder: (context, index) {
                  return DateAndCountdownWidget(
                    session: reservation.sessions![index],
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
