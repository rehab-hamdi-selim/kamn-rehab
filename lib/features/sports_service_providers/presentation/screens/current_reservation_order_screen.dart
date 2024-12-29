import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/utils/custom_app_bar.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/current_reseravaion_order/current_orders_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/current_reseravaion_order/current_orders_state.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/service_provider_grounds/service_provider_grounds_view_model.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/current_reservation_order/custom_Category_tabs.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/current_reservation_order/custom_current_orders_tile.dart';

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
        length: SportsTabs.values.length, // Number of tabs

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

enum SportsTabs {
  football,
  basketball,
  tennis,
  volleyball,
  skyDiving,
  swimming
}

extension SportsTabsExtension on SportsTabs {
  String get displayName {
    switch (this) {
      case SportsTabs.football:
        return 'Football';
      case SportsTabs.basketball:
        return "Basketball";
      case SportsTabs.tennis:
        return "Tennis";
      case SportsTabs.volleyball:
        return "Volleyball";
      case SportsTabs.skyDiving:
        return "Sky Diving";
      case SportsTabs.swimming:
        return "Swimming";
    }
  }

  Color get sportColor {
    switch (this) {
      case SportsTabs.football:
        return AppPallete.greenColor;
      case SportsTabs.basketball:
        return AppPallete.pinkColor;
      case SportsTabs.tennis:
        return AppPallete.orangeColor;
      case SportsTabs.volleyball:
        return AppPallete.yellowColor;
      case SportsTabs.skyDiving:
        return AppPallete.lightVoivetteColor;
      case SportsTabs.swimming:
        return AppPallete.lightBlueColor;
    }
  }
}
