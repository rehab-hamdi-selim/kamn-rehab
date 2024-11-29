import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/theme/font_weight_helper.dart';
import 'package:kamn/features/admin/data/models/analytics_data_model.dart';
import 'package:kamn/features/admin/presentation/cubits/first_page_cupit/analytics_cubit.dart';
import 'package:kamn/features/admin/presentation/cubits/first_page_cupit/analytics_state.dart';
import 'package:kamn/features/admin/presentation/widgets/first_analytics_page/custom_card_widget.dart';
import 'package:kamn/features/admin/presentation/widgets/first_analytics_page/custom_drop_down_menu.dart';
import 'package:kamn/features/admin/presentation/widgets/first_analytics_page/custom_chart_widget.dart';
import 'package:kamn/features/admin/presentation/widgets/first_analytics_page/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/app_images.dart';

class FirstAnalyticsPage extends StatelessWidget {
  FirstAnalyticsPage({super.key});
  late AnalyticsDataModel data;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyticsCubit, AnalyticsState>(
      builder: (context, state) {
        if (state.isInitial || state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        data = state.analyticsdata!.elementAt(0);
        return Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.grey[100],
            title: const Text(
              Constants.overview,
              style: TextStyle(fontWeight: FontWeightHelper.semiBold),
            ),
            actions: [
              const Icon(Icons.notifications_outlined),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Container(
                  child: const CircleAvatar(
                    backgroundImage: AssetImage(AppImages.profileImage),
                    radius: 16,
                  ),
                ),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomCardWidget(
                    backgroundcolor: const Color(0xffFFDC86),
                    iconcolor: const Color(0xffE67240),
                    height: 110.h,
                    width: 170.w,
                    title: data.title,
                    number: data.number,
                    percentage: data.percentage,
                    percntagecolor: Colors.red,
                  ),
                  CustomCardWidget(
                    backgroundcolor: const Color(
                      0xffAEFF9E,
                    ),
                    iconcolor: const Color(
                      0xff016F13,
                    ),
                    height: 110.h,
                    width: 170.w,
                    title: data.title,
                    number: data.number,
                    percentage: data.percentage,
                    percntagecolor: Colors.red,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomCardWidget(
                    height: 110.h,
                    width: 170.w,
                    backgroundcolor: Colors.white,
                    title: data.title,
                    number: data.number,
                    percentage: data.percentage,
                  ),
                  CustomCardWidget(
                      height: 110.h,
                      width: 170.w,
                      backgroundcolor: Colors.white,
                      title: data.title,
                      number: data.number,
                      percentage: data.percentage)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomCardWidget(
                      height: 110.h,
                      width: 345.w,
                      backgroundcolor: Colors.white,
                      title: data.title,
                      number: data.number,
                      percentage: data.percentage)
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            Constants.salesOverView,
                            style: TextStyle(
                                fontWeight: FontWeightHelper.semiBold),
                          ),
                          dropDownMenu()
                        ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.number ?? '',
                            style: TextStyle(
                                fontWeight: FontWeightHelper.bold,
                                fontSize: 26.h),
                          ),
                        ]),
                  ),
                ),
              ),
              chartWidget(),
            ]),
          ),
          bottomNavigationBar: bottomNavBar(),
        );
      },
    );
  }
}
