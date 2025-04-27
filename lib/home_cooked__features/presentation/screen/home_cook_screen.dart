import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/home_cooked__features/presentation/cubits/add_home_cook/add_home_cook_cubit.dart';
import 'package:kamn/home_cooked__features/presentation/screen/meal_info_screen.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/add_home_cook/add_home_cook_info/custom_add_home_cook_bloc_listener.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/add_home_cook/add_home_cook_info/custom_home_cook_tab_bar.dart';

class HomeCookScreen extends StatefulWidget {
  const HomeCookScreen({super.key});

  @override
  State<HomeCookScreen> createState() => _HomeCookScreenState();
}

class _HomeCookScreenState extends State<HomeCookScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    context.read<AddHomeCookCubit>().initTabController(this);
  }

  @override
  Widget build(BuildContext context) {
    return CustomAddHomeCookBlocListener(
      child: Scaffold(
        backgroundColor: AppPallete.whiteColor,
        // appBar: CustomGymAppBar.appBar(
        //   color: AppPallete.whiteColor,
        //   context: context,
        //   notificationIconFunction: () {},
        //   badgesIconFunction: () {},
        // ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomHeaderHomeCook(),
              Expanded(child: CustomHomeCookTabBar()),
            ],
          ),
        ),
      ),
    );
  }
}
