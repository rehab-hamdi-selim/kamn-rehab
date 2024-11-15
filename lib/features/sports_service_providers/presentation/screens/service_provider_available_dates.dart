import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/available_dates/available_dates_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/available_dates/available_dates_state.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/available_dates/custome_available_dates_bloc_listener.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/available_dates/custome_available_interval.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/available_dates/custome_select_time_bottom_sheet.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/available_dates/custome_submit_button.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/service_provider_grounds/custom_app_bar_service_provider.dart';

class ServiceProviderAvailableDates extends StatelessWidget {
  final String playgroundId;
  const ServiceProviderAvailableDates({super.key, required this.playgroundId});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AvailableDatesCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!cubit.isOpened) {
        showBottomSheet(context);
        cubit.isOpened = true;
        cubit.calculateIntervails();
      }
    });

    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBarServiceProvider.appBar(
          arrowFunction: () {},
          notificationIconFunction: () {},
          profileFunction: () {},
          badgesIconFunction: () {},
        ),
        body: CustomeAvailableDatesBlocListener(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<AvailableDatesCubit, AvailableDatesState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Available Time Slots:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    activeColor: Colors.blueAccent,
                                    value: cubit.isSelectAll,
                                    onChanged: (value) {
                                      cubit.onSelectAll(value ?? false);
                                    },
                                  ),
                                  const Text("Select All"),
                                ],
                              ),
                              TextButton(
                                  onPressed: () {
                                    showBottomSheet(context);
                                  },
                                  child: const Text('create intervals'))
                            ],
                          ),
                        ],
                      ),
                      Wrap(runSpacing: 10, spacing: 10, children: [
                        if (state.intervials != null &&
                            state.intervials!.isNotEmpty) ...[
                          ...state.intervials!.map(
                            (interval) => CustomeAvailableInterval(
                              interval: interval,
                            ),
                          ),
                        ] else
                          const Center(child: Text('No intervals calculated')),
                      ]),
                      CustomeSubmitButton(
                        playgroundId: playgroundId,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        showDragHandle: true,
        isDismissible: false,
        builder: (_) => BlocProvider.value(
              value: context.read<AvailableDatesCubit>(),
              child: const CustomeSelectTimeBottomSheet(),
            ));
  }
}
