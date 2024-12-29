import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/helpers/spacer.dart';

class CustomeMenuItem extends StatelessWidget {
  final String icon;
  final String title;
  final void Function()? goTo;

  const CustomeMenuItem(
      {super.key, required this.icon, required this.title, required this.goTo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            leading: SvgPicture.asset(icon),
            // Responsive icon size
            title: Text(
              title,
              style: TextStyle(fontSize: 16.sp), // Responsive font size
            ),
            trailing:
                Icon(Icons.arrow_forward_ios, size: 16.sp, color: Colors.grey),
            // Responsive icon size
            onTap: goTo),
        divider(25.w, 25.w), // Responsive indent
      ],
    );
  }
}
