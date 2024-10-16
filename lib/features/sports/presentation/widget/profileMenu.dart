import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/features/sports/presentation/widget/menuItem.dart';

class ProfileMenuCustome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: MenuItemCustome(icon: Icons.flight, title: "My Reservations"),
        ),
        Divider(endIndent: 25.w, indent: 25.w), // Responsive indent
        MenuItemCustome(
            icon: Icons.local_grocery_store_outlined, title: "My Store"),
        Divider(endIndent: 25.w, indent: 25.w), // Responsive indent
        SizedBox(
          height: 70,
        ),
        MenuItemCustome(
            icon: Icons.group_add_outlined, title: "Invite Friends"),
        Divider(endIndent: 25.w, indent: 25.w),
        MenuItemCustome(icon: Icons.question_mark, title: "My Order"),
        Divider(endIndent: 25.w, indent: 25.w),
        MenuItemCustome(icon: Icons.settings, title: "Settings"),
      ],
    );
  }
}
