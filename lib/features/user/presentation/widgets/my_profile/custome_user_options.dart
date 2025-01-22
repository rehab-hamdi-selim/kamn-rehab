import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_state.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/features/user/presentation/widgets/my_profile/custome_menu_item.dart';

class CustomeUserOptions extends StatelessWidget {
  const CustomeUserOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppUserCubit, AppUserState>(
      builder: (context, state) {
        return ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            CustomeMenuItem(
              icon: 'assets/icons/reservations.svg',
              title: "My Reservations",
              goTo: () {
                Navigator.pushNamed(context, Routes.viewResrvationScreen);
              },
            ),
            if (state.user?.type == 'serviceProvider' ||
                state.user?.type == 'admin')
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
              goTo: () {},
            ),
            if (state.user?.type == 'serviceProvider' ||
                state.user?.type == 'admin')
              CustomeMenuItem(
                icon: 'assets/icons/order.svg',
                title: "My Order",
                goTo: () {
                  Navigator.pushNamed(context, Routes.finishOrderScreen);
                },
              ),
            if (state.user?.type == 'serviceProvider' ||
                state.user?.type == 'admin')
              CustomeMenuItem(
                icon: 'assets/icons/dashboard.svg',
                title: "Dashboard",
                goTo: () {
                  Navigator.pushNamed(context, Routes.currentOrderScreen);
                },
              ),
            if (state.user?.type == 'admin')
              CustomeMenuItem(
                icon: 'assets/icons/admin.svg',
                title: "Admin",
                goTo: () {
                  Navigator.pushNamed(
                      context, Routes.chooseServiceCategoryScreen);
                },
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
