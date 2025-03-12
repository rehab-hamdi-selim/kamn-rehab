import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/const/icon_links.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_gym_app_bar.dart';
import 'package:kamn/gym_feature/gyms/data/models/plan_model.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_mempership_screen/build_mempership_card.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_mempership_screen/custom_title_logo.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_mempership_screen/tab_bar_mempership.dart';

class ChooseMempershipPlanScreen extends StatefulWidget {
  const ChooseMempershipPlanScreen({super.key});

  @override
  State<ChooseMempershipPlanScreen> createState() =>
      _ChooseMempershipPlanScreenState();
}

class _ChooseMempershipPlanScreenState extends State<ChooseMempershipPlanScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomGymAppBar.appBar(
        color: AppPallete.whiteColor,
        context: context,
        notificationIconFunction: () {},
        badgesIconFunction: () {},
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTitleLogo(),
              SizedBox(height: 10.h),
              SizedBox(
                height: 410.h,
                child: TabBarApp(
                  tabController: _tabController,
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150.w,
                    height: 50.h,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_back, color: Colors.black),
                          SizedBox(width: 8),
                          Text("Back", style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 150.w,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {
                        _showDialog(
                          context,
                          PlanModel.fakeList[_tabController.index],
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text("Confirm",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h), // Add bottom padding
            ],
          ),
        ),
      ),
    );
  }
}

Future<dynamic> _showDialog(BuildContext context, PlanModel plan) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: AppPallete.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: SingleChildScrollView(
            // Make dialog scrollable too
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Confirm Your Plan",
                      style: TextStyles.fontCircularSpotify20AccentBlackMedium),
                  BuildMempershipCard(plan: plan),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      const Icon(Icons.check_box, color: Colors.black),
                      SizedBox(width: 10.h),
                      const Text('Accept all condetions and terms'),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 40.h,
                        width: 120.w,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: AppPallete.redColor,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                        width: 122.w,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: AppPallete.blackColor,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            "Proceed to Payment",
                            style: TextStyles.fontCircularSpotify10White,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
