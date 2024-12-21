import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/features/sports/presentation/widgets/my_profile/custome_menu_item.dart';

class CustomeUserOptions extends StatelessWidget {
  const CustomeUserOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomeMenuItem(
          icon: 'assets/icons/reservations.svg',
          title: "My Reservations",
          goTo: () {},
        ),
        verticalSpace(16.h),
        divider(25.w, 25.w), // Responsive indent
        CustomeMenuItem(
          icon: 'assets/icons/services.svg',
          title: "My Services",
          goTo: () {},
        ),
        verticalSpace(16.h),
        divider(25.w, 25.w), // Responsive indent
        CustomeMenuItem(
          icon: 'assets/icons/store.svg',
          title: "My Store",
          goTo: () {},
        ),
        verticalSpace(16.h),
        divider(25.w, 25.w), //  Responsive indent
        CustomeMenuItem(
          icon: 'assets/icons/order.svg',
          title: "My Order",
          goTo: () {},
        ),
        verticalSpace(16.h),
        divider(25.w, 25.w),
        CustomeMenuItem(
          icon: 'assets/icons/dashboard.svg',
          title: "Dashboard",
          goTo: () {},
        ),
        verticalSpace(16.h),
        divider(25.w, 25.w),
        CustomeMenuItem(
          icon: 'assets/icons/settings.svg',
          title: "Settings",
          goTo: () {},
        ),
        verticalSpace(16.h),
      ],
    );
  }
}
