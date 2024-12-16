import 'package:flutter/material.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/features/sports/presentation/widgets/view_reservation_screen.dart/custom_reservation_item.dart';

class CustomReservationList extends StatelessWidget {
  const CustomReservationList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return const CustomReservationItem();
        },
        separatorBuilder: (context, index) {
          return verticalSpace(6);
        },
        itemCount: 10);
  }
}
