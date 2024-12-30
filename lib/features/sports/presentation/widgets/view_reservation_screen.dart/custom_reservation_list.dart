import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/routing/routes.dart';
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
          final data = state.reservations;
          return ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.reservationScreen,
                        arguments: data[index]);
                  },
                  child: CustomReservationItem(
                    reservation: data[index],
                  ),
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
