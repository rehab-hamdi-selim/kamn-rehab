import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/utils/custom_gym_app_bar.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_head_title.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_tab_bar.dart';

class AddGymScreen extends StatefulWidget {
  const AddGymScreen({super.key});

  @override
  State<AddGymScreen> createState() => _AddGymScreenState();
}

class _AddGymScreenState extends State<AddGymScreen> {



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppPallete.whiteColor,
      appBar: CustomGymAppBar.appBar(
          color: AppPallete.whiteColor,
          context: context,
          notificationIconFunction: () {},
          badgesIconFunction: () {},
        ),
      body:  Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
        // ignore: prefer_const_constructors
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
          CustomHeadTitle(),
         Expanded(
         
          child: CustomTabBar()),
        ],),
      ),
    );
  }
}
