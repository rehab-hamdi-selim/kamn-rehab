import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_cubit.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_state.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_gym_features_section.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_gym_info_section.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_required_documents_section.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddGymCubit>();
    return DefaultTabController(
      length: cubit.tabs.length,
      child: BlocBuilder<AddGymCubit, AddGymState>(
        buildWhen: (previous, current) => current.isInitial||current.isSwipped,
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
                  controller: state.tabController,
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
                  controller: state.tabController,
                  children: [
                    CustomGymInfoSection(),
                    const CustomRequiredDocumentsSection(),
                    const CustomGymFeaturesSection(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
