import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/utils/custom_app_bar.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/cubit/current_reseravaion_order/current_orders_cubit.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/cubit/current_reseravaion_order/current_orders_state.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/widgets/current_reservation_order/custom_category_tabs.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/widgets/current_reservation_order/custom_current_orders_tile.dart';

class CurrentOrdersScreen extends StatelessWidget {
  const CurrentOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.whiteColor,
      appBar: CustomAppBar.appBar(
          color: AppPallete.whiteColor,
          context: context,
          notificationIconFunction: () {},
          badgesIconFunction: () {}),
      body: DefaultTabController(
        length: Sport.values.length, // Number of tabs

        child: Column(
          children: [
            const CustomCategoryTabs(),
            Expanded(
              child: BlocBuilder<CurrentOrdersCubit, CurrentOrdersState>(
                builder: (context, state) {
                  if (state.isLoading || state.isInitial) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final reservations = state.reservations;
                  if (reservations == null ||reservations.isEmpty ) {
                    return const Center(
                      child: Text('No Current Orders'),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: state.reservations?.length,
                      itemBuilder: (context, index) {
                        return CurrentOrdersTile(
                            numOfActiveReservation:
                                reservations.where((element) {
                              return element.ground?.playgroundName ==
                                  reservations[index].ground?.playgroundName;
                            }).length,
                            reservation: reservations[index]);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


