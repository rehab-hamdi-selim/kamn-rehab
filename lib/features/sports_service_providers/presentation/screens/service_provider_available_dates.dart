import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/available_dates/available_dates_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/available_dates/available_dates_state.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/available_dates/custome_available_dates_bloc_listener.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/available_dates/custome_available_interval.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/available_dates/custome_choose_available_dates.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/available_dates/custome_select_time_bottom_sheet.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/available_dates/custome_submit_button.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/service_provider_grounds/custom_app_bar_service_provider.dart';

class ServiceProviderAvailableDates extends StatelessWidget {
  final String playgroundId;
  ServiceProviderAvailableDates({super.key, required this.playgroundId});
  String day = '';
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AvailableDatesCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!cubit.isOpened) {
        showMyBottomSheet(context);
        cubit.isOpened = true;
        cubit.calculateIntervails();
      }
    });

    return DefaultTabController(
      length: WeekDays.values.length,
      child: Scaffold(
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
              child: Column(
                children: [
                  TabBar(
                      labelPadding: EdgeInsets.symmetric(horizontal: 5.w),
                      tabs: WeekDays.values.map((element) {
                        return Tab(
                          text: element.name,
                        );
                      }).toList()),
                  Expanded(
                    child: TabBarView(
                        children: WeekDays.values.map((element) {
                      day = element.name;
                      return CustomeChooseAvailableDates(
                          playgroundId: playgroundId, day: element.name);
                    }).toList()),
                  ),
                  CustomeSubmitButton(
                    playgroundId: playgroundId,
                  )
                ],
              ),
            ),
          )),
    );
  }
}

void showMyBottomSheet(BuildContext context) {
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
