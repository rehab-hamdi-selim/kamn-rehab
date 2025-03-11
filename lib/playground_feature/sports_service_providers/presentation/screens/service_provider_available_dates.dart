import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/utils/custom_app_bar.dart';
import 'package:kamn/playground_feature/sports_service_providers/data/model/playground_request_model.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/cubit/available_dates/available_dates_cubit.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/widgets/available_dates/custome_available_dates_bloc_listener.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/widgets/available_dates/custome_choose_available_dates.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/widgets/available_dates/custome_select_time_bottom_sheet.dart';
import 'package:kamn/playground_feature/sports_service_providers/presentation/widgets/available_dates/custome_submit_button.dart';

class ServiceProviderAvailableDates extends StatelessWidget {
  final PlaygroundRequestModel playground;
  const ServiceProviderAvailableDates({super.key, required this.playground});
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
          appBar: CustomAppBar.appBar(
            context: context,
            color: AppPallete.whiteColor,
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
                      return CustomeChooseAvailableDates(
                          playground: playground, day: element.name);
                    }).toList()),
                  ),
                  CustomeSubmitButton(
                    playground: playground,
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
