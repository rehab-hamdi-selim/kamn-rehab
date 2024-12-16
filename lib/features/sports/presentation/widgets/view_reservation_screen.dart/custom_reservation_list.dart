import 'package:flutter/material.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/features/sports/presentation/widgets/view_reservation_screen.dart/custom_reservation_item.dart';

class CustomReservationList extends StatelessWidget {
  const CustomReservationList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return const CustomReservationItem(
            groundName: 'Hadra Stadium East .1',
            ownreName: 'mahmoud sayed',
            address: 'Alexandria, Hadra',
            rate: 4.5,
            review: 123,
            date: 'Monday, 16 Sep 2024',
            price: 250,
            timeToEnd: '7:30 PM',
            timeToStart: '6:30 PM',
          );
        },
        separatorBuilder: (context, index) {
          return verticalSpace(6);
        },
        itemCount: 10);
  }
}
