import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/utils/custom_app_bar.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/dashboard/custom_order_box.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppPallete.whiteColor,
        appBar: CustomAppBar.appBar(
          color: AppPallete.whiteColor,
          context: context,
          notificationIconFunction: () {},
          badgesIconFunction: () {},
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(children: [
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomOrderBox(
                    color: AppPallete.orangeColor,
                    num: 24,
                    title: 'Current Orders',
                    ratio: 2.5,
                    titleIcon: Icons.shopping_cart,
                    photo: "assets/icons/increase_icon.svg",
                  ),
                  CustomOrderBox(
                    color: AppPallete.greenColor,
                    num: 12,
                    title: 'Finished Orders',
                    ratio: 2.5,
                    titleIcon: Icons.list_alt_rounded,
                    photo: "assets/icons/decrase_icon.svg",
                  )
                ]),
            verticalSpace(20.h),
            // LineChart(
            //   duration: Duration(milliseconds: 150),
            //   curve: Curves.linear,
            //   LineChartData(
                   
            //       // read about it in the LineChartData section
            //       ),
            //   // Optional
            // )
          ]),
        ));
  }
}
