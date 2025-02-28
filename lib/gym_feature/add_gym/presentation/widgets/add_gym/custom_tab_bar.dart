import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_gym_features_section.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_gym_info_section.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_required_documents_section.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> tabs = ["Gym Info", "Required Documents", "Gym Features"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Column(
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
          
              controller: _tabController,dividerHeight: 0,
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
              tabs: tabs.map((tab) => IntrinsicWidth(child: Tab(text: tab,))).toList(),
            ),
          ),
          verticalSpace(16),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
               CustomGymInfoSection(),
               const CustomRequiredDocumentsSection(),
               const CustomGymFeaturesSection(),

                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
