import 'package:flutter/material.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/features/sports/data/models/reservation_model.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/track_ground_reservation_details/date_and_countdown_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ReservationDetailsItem extends StatelessWidget {
  final ReservationModel data;
  ReservationDetailsItem({required this.data});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: 250,
        decoration: BoxDecoration(
            color: AppPallete.lightGrayColor,
            border: Border.all(color: AppPallete.whiteGreenColor, width: 2),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.person_outlined),
                  const Spacer(
                    flex: 1,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reserved by :',
                        style: TextStyle(color: AppPallete.grayColor),
                      ),
                      Text(
                        'name name',
                        style: TextStyle(color: AppPallete.greenColor),
                      )
                    ],
                  ),
                  const Spacer(
                    flex: 9,
                  ),
                  const Icon(Icons.call_outlined),
                  GestureDetector(
                    onTap: () async {
                      final Uri launchUri = Uri(
                        scheme: 'tel',
                        path: '0123445678',
                      );
                      await launchUrl(launchUri);
                    },
                    child: Text('phone number',
                        style: TextStyle(color: AppPallete.greenColor)),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(Icons.check_circle_outline),
                  Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('paybal',
                            style: TextStyle(color: AppPallete.grayColor)),
                        Text('${data.price}/hr ',
                            style: TextStyle(color: AppPallete.greenColor))
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount:
                      data.sessions!.length, // Number of items in the list
                  itemBuilder: (context, index) {
                    return DateAndCountdownWidget(
                      data: data.sessions![index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
