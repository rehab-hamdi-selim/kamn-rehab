import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/gyms/data/models/plan_model.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_mempership_screen/build_mempership_card.dart';

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key, required this.tabController});
  final TabController tabController;
  final List<String> choices = const ['Monthly', 'Quarterly', 'Annual'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 38.w),
          height: 37.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppPallete.ofWhiteColor,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: AppPallete.lightGreyColor, width: 0.2),
          ),
          child: TabBar(
            controller: tabController,
            dividerHeight: 0,
            indicatorPadding: EdgeInsets.symmetric(vertical: -3.h),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            labelStyle: TextStyles.fontCircularSpotify12WhiteRegular,
            unselectedLabelStyle: TextStyles.fontCircularSpotify10BlackRegular,
            tabs: choices.map((choice) => Tab(text: choice)).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 8.0),
          child: SizedBox(
            height: 30.h,
            width: 300.w,
            child: Center(
              child: Text(
                "All plans come with free onboarding by a personal trainer!",
                style: TextStyles.fontCircularSpotify11BlackLight,
              ),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: PlanModel.fakeList
                .map(
                  (element) => SingleChildScrollView(
                    child: BuildMempershipCard(
                      plan: element,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
