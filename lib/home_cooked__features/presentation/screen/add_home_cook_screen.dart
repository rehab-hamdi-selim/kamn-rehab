import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/utils/custom_gym_app_bar.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_cubit.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_head_title.dart';
import 'package:kamn/gym_feature/add_gym/presentation/widgets/add_gym/custom_tab_bar.dart';
import 'package:kamn/home_cooked__features/presentation/widgets/add_home_cook/add_gym/custom_add_gym_bloc_listener.dart';

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
    context.read<AddGymCubit>().initTabController(this);
  }

  @override
  Widget build(BuildContext context) {
    return CustomAddGymBlocListener(
      child: Scaffold(
        backgroundColor: AppPallete.whiteColor,
        appBar: CustomGymAppBar.appBar(
          color: AppPallete.whiteColor,
          context: context,
          notificationIconFunction: () {},
          badgesIconFunction: () {},
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomHeadTitle(),
              Expanded(child: CustomTabBar()),
            ],
          ),
        ),
      ),
    );
  }
}
