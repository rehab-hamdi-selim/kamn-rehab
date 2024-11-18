import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:kamn/features/admin/presentation/widgets/second_page/custom_analytics_chart.dart';
import 'package:kamn/features/admin/presentation/widgets/second_page/custom_expacted_earning_chart.dart';
import 'package:kamn/features/admin/presentation/widgets/second_page/custom_expacted_earning_chart_data.dart';
import 'package:kamn/features/admin/presentation/widgets/second_page/custom_income_outcome_item.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/service_provider_grounds/custom_app_bar_service_provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.whiteColor,
      appBar: CustomAppBarServiceProvider.appBar(
        arrowFunction: () {},
        notificationIconFunction: () {},
        profileFunction: () {},
        badgesIconFunction: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Center(
          child: Column(
            children: [
              const Expanded(
                flex: 3,
                child: CustomExpactedEarningChart(),
              ),
              const Expanded(
                flex: 2,
                child: CustomAnalyticsChart(),
              ),
              verticalSpace(18.h),
              const Expanded(
                flex: 1,
                child: CustomIncomeOutcomeItem(
                    text: 'Income', money: '345,334 EGP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
