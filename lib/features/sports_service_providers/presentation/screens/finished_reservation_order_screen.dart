import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/utils/custom_app_bar.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/finished_reseravaion_order/finished_order_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/finished_reseravaion_order/finished_order_state.dart';
import 'package:kamn/features/sports_service_providers/presentation/screens/current_reservation_order_screen.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/add_service/custome_app_bar.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/finished_order_list/custom_finished_category_tab.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/finished_order_list/custom_finished_order_tile.dart';

class FinishedOrdersScreen extends StatelessWidget {
  const FinishedOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.whiteColor,
      appBar: CustomAppBar.appBar(
          color: Colors.white,
          context: context,
          notificationIconFunction: () {},
          badgesIconFunction: () {}),
      body: DefaultTabController(
        length: SportsTabs.values.length, // Number of tabs

        child: Column(
          children: [
            const CustomFinishedOrdersTabs(),
            Expanded(
              child: BlocBuilder<FinishedOrdersCubit, FinishedOrdersState>(
                builder: (context, state) {
                  if (state.isLoading || state.isInitial) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final reservations = state.reservations;
                  if (reservations == null || reservations.isEmpty) {
                    return const Center(
                      child: Text('No Current Orders'),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: state.reservations?.length,
                      itemBuilder: (context, index) {
                        return CustomFinishedOrdersTile(
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
