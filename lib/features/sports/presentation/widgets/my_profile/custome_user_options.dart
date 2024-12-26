import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_state.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/features/sports/presentation/widgets/my_profile/custome_menu_item.dart';

class CustomeUserOptions extends StatelessWidget {
  const CustomeUserOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppUserCubit, AppUserState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomeMenuItem(
              icon: 'assets/icons/reservations.svg',
              title: "My Reservations",
              goTo: () {
                Navigator.pushNamed(context, Routes.viewResrvationScreen);
              },
            ),
            if (state.user?.type == 'serviceProvider')
              CustomeMenuItem(
                icon: 'assets/icons/services.svg',
                title: "My Services",
                goTo: () {
                  Navigator.pushNamed(context, Routes.trackGroundResrvations);
                },
              ),
            CustomeMenuItem(
              icon: 'assets/icons/store.svg',
              title: "My Store",
              goTo: () {
                Navigator.pushNamed(
                    context, Routes.chooseServiceCategoryScreen);
              },
            ),
            CustomeMenuItem(
              icon: 'assets/icons/order.svg',
              title: "My Order",
              goTo: () {},
            ),
            if (state.user?.type == 'serviceProvider')
              CustomeMenuItem(
                icon: 'assets/icons/dashboard.svg',
                title: "Dashboard",
                goTo: () {},
              ),
            CustomeMenuItem(
              icon: 'assets/icons/settings.svg',
              title: "Settings",
              goTo: () {},
            ),
          ],
        );
      },
    );
  }
}
