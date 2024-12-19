import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/features/sports/presentation/cubits/view_reservation/view_reservation_cubit.dart';
import 'package:kamn/features/sports/presentation/cubits/view_reservation/view_reservation_state.dart';
import 'package:kamn/features/sports/presentation/widgets/view_reservation_screen.dart/custom_reservation_item.dart';

class CustomReservationList extends StatelessWidget {
  const CustomReservationList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewReservationCubit, ViewReservationState>(
      builder: (context, state) {
        if (state.inLoading || state.inIntial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.inFailure) {
          return Center(child: Text('Opps, There are error\n${state.error}'));
        } else {
          final data = state.reservation;
          return ListView.separated(
              itemBuilder: (context, index) {
                return CustomReservationItem(
                  groundName: data[index].name!,
                  ownreName: 'mahmoud sayed',
                  address: data[index].address!,
                  rate: data[index].rating ?? 0,
                  review: 123,
                  date: 'Monday, 16 Sep 2024',
                  price: data[index].price ?? 0,
                  timeToEnd: '7:30 PM',
                  timeToStart: '6:30 PM',
                );
              },
              separatorBuilder: (context, index) {
                return verticalSpace(6);
              },
              itemCount: data!.length);
        }
      },
    );
  }
}
