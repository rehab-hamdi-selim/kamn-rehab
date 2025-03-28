import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/add_home_cook/add_home_cook_cubit.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/add_home_cook/add_home_cook_state.dart';
import 'package:kamn/home_cooked__features/presentation/screen/home_-cook_info_screen.dart';
import 'package:kamn/home_cooked__features/presentation/screen/verify_location_screen_screen.dart';

class CustomHomeCookTabBar extends StatelessWidget {
  const CustomHomeCookTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddHomeCookCubit>();
    return DefaultTabController(
      length: cubit.tabs.length,
      child: BlocBuilder<AddHomeCookCubit, AddHomeCookState>(
        buildWhen: (previous, current) =>
            current.isInitial || current.isSwipped,
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(height: 20.h),
              Container(
                height: 47.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: TabBar(
                  onTap: (index) {
                    _onTabTapped(index, cubit.tabController, context);
                  },
                  controller: cubit.tabController,
                  dividerHeight: 0,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  labelStyle: TextStyles.fontCircularSpotify12WhiteRegular,
                  unselectedLabelStyle:
                      TextStyles.fontCircularSpotify10BlackRegular,
                  tabs: cubit.tabs
                      .map((tab) => IntrinsicWidth(
                              child: Tab(
                            text: tab,
                          )))
                      .toList(),
                ),
              ),
              verticalSpace(16),
              Expanded(
                child: TabBarView(
                  controller: cubit.tabController,
                  children: const [
                    CustomGymInfoScreen(),
                    VerifyLocationScreenScreen(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _onTabTapped(
      int index, TabController _tabController, BuildContext context) {
    // Prevent switching tabs from index 0 no matter what
    if (index == 1) {
      context.read<AddHomeCookCubit>().validateHomeCookInfo();
    }
  }
}
